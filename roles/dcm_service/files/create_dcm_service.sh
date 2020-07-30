#!/bin/bash

echo [Unit] | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo Description=DCM REST Client | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo [Service] | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo User=$1 | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo ExecStart=/usr/bin/sudo /usr/bin/python3 /usr/bin/dcm/dcm-python/dcm_rest_client.py --dcm_ip_address $2 --port 8090 --log info | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo [Install] | sudo tee -a /etc/systemd/system/dcm.service > /dev/null
echo WantedBy=default.target | sudo tee -a /etc/systemd/system/dcm.service > /dev/null

sudo chmod 664 /etc/systemd/system/dcm.service
sudo systemctl daemon-reload
sudo systemctl enable dcm.service
