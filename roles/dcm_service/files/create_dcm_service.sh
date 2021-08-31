#!/bin/bash

# TODO we should change this so it reflects latest changes

echo "[Unit]" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "Description=DCM REST Client" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "Requires=kafka-mirror-french-site.service kafka-mirror-greek-site.service kafka-mirror-italian-site.service kafka-mirror-spanish-site.service" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "After=kafka-mirror-french-site.service kafka-mirror-greek-site.service kafka-mirror-italian-site.service kafka-mirror-spanish-site.service" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "[Service]" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "User=$1" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "ExecStart=/usr/bin/sudo /usr/bin/python3 /usr/bin/dcm/dcm-python/dcm_rest_client.py --dcm_ip_address $2 --spanish_site_plugin_ip_port $3 --italian_site_plugin_ip_port $4 --french_site_plugin_ip_port $5 --greek_site_plugin_ip_port $6 --port 8090 --log info" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "TimeoutSec=10" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "Restart=on-failure" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "RestartSec=1" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "[Install]" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo "WantedBy=default.target" | sudo tee -a /etc/systemd/system/dcm.service > /dev/null

sudo chmod 664 /etc/systemd/system/dcm.service
sudo systemctl daemon-reload
sudo systemctl enable dcm.service
