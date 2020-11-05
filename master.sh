#!/bin/bash

apt update && apt install -y openjdk-8-jdk python3 python3-tk python3-pip python3-dev libxml2-dev libxslt-dev zlib1g-dev net-tools

python3 -m pip install bzt

source common.sh

echo "java.rmi.server.hostname=10.114.0." >> ../jmeter/jmeter5.2/bin/system.properties
