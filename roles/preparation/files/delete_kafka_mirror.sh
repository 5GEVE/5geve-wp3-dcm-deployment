#!/bin/bash
# Arguments:
# 1-topic name

TOPIC=$1

kill -9 $(ps aux | grep $TOPIC | awk '{print $2}')
