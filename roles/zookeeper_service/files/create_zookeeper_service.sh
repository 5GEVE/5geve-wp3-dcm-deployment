#!/bin/bash

echo [Unit] | sudo tee -a /etc/systemd/system/zookeeper.service > /dev/null
echo Description=Zookeeper Service | sudo tee -a /etc/systemd/system/zookeeper.service > /dev/null
echo | sudo tee -a /etc/systemd/system/zookeeper.service > /dev/null
echo [Service] | sudo tee -a /etc/systemd/system/zookeeper.service > /dev/null
echo ExecStart=/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties | sudo tee -a /etc/systemd/system/zookeeper.service > /dev/null
echo | sudo tee -a /etc/systemd/system/zookeeper.service > /dev/null
echo [Install] | sudo tee -a /etc/systemd/system/zookeeper.service > /dev/null
echo WantedBy=default.target | sudo tee -a /etc/systemd/system/zookeeper.service > /dev/null

sudo chmod 664 /etc/systemd/system/zookeeper.service
sudo systemctl daemon-reload
sudo systemctl enable zookeeper.service
