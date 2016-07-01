#!/bin/bash

set -ue

# Find only the newest file to deploy
files=`find /tmp/deploy/ -type f -name '*jar' \
 -printf "%T+\t%p\n" | sort -r | head -1 | awk '{print $2}'`

if [ ! -z "${files}" ]; then
  mv ${files} /opt/jarservice.jar
  /usr/sbin/service ball2_service stop
  sleep 2
  /usr/sbin/service ball2_service start
  sleep 5
fi
