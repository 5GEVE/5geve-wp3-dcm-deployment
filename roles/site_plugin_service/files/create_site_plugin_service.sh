#!/bin/bash

echo [Unit] | sudo tee -a /etc/systemd/system/dcm_site_plugin.service > /dev/null
echo Description=DCM Site Plugin REST Client | sudo tee -a /etc/systemd/system/dcm_site_plugin.service > /dev/null
echo | sudo tee -a /etc/systemd/system/dcm_site_plugin.service > /dev/null
echo [Service] | sudo tee -a /etc/systemd/system/dcm_site_plugin.service > /dev/null
echo User=$1 | sudo tee -a /etc/systemd/system/dcm_site_plugin.service > /dev/null
echo ExecStart=/usr/bin/sudo /usr/bin/python3 /usr/bin/dcm/dcm-site-plugin/dcm_site_plugin_rest_client.py --site_ip_address $2 --port $3 --kafka_topics_script_route $4 --log info | sudo tee -a /etc/systemd/system/dcm_site_plugin.service > /dev/null
echo | sudo tee -a /etc/systemd/system/dcm_site_plugin.service > /dev/null
echo [Install] | sudo tee -a /etc/systemd/system/dcm_site_plugin.service > /dev/null
echo WantedBy=default.target | sudo tee -a /etc/systemd/system/dcm_site_plugin.service > /dev/null

sudo chmod 664 /etc/systemd/system/dcm_site_plugin.service
sudo systemctl daemon-reload
sudo systemctl enable dcm_site_plugin.service
