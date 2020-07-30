#!/bin/bash

echo [Unit] | sudo tee -a /etc/systemd/system/kafka.service > /dev/null
echo Description=Kafka Service | sudo tee -a /etc/systemd/system/kafka.service > /dev/null
echo | sudo tee -a /etc/systemd/system/kafka.service > /dev/null
echo [Service] | sudo tee -a /etc/systemd/system/kafka.service > /dev/null
echo ExecStart=/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties | sudo tee -a /etc/systemd/system/kafka.service > /dev/null
echo | sudo tee -a /etc/systemd/system/kafka.service > /dev/null
echo [Install] | sudo tee -a /etc/systemd/system/kafka.service > /dev/null
echo WantedBy=default.target | sudo tee -a /etc/systemd/system/kafka.service > /dev/null

sudo chmod 664 /etc/systemd/system/kafka.service
sudo systemctl daemon-reload
sudo systemctl enable kafka.service
