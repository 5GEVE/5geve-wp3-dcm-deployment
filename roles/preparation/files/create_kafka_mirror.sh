#!/bin/bash
# Arguments:
# 1-site
# 2-topic name

SITE=$1
TOPIC=$2

/opt/kafka/bin/kafka-run-class.sh kafka.tools.MirrorMaker --consumer.config /usr/bin/dcm/${SITE}_consumer.config --num.streams 1 --producer.config /usr/bin/dcm/producer.config --whitelist \'${TOPIC}\' &
