#!/bin/bash

apt update && apt install -y openjdk-8-jdk net-tools glances

IP=$(ifconfig | grep -Eo 'inet 10\.114\.0\.[0-9]{1,3}' | grep -o [0-9].*)
RAM=$(cat /proc/meminfo | grep MemTotal | grep -o '[[:digit:]]*')
RAM=$(($RAM/1024/1024))

git clone git@github.com:wiosna-dev/jmeter.git ../jmeter

cp ../jmeter/jmeter5.2/bin/jmeter.dist ../jmeter/jmeter5.2/bin/jmeter

cp ../jmeter/jmeter5.2/bin/jmeter.properties.dist ../jmeter/jmeter5.2/bin/jmeter.properties

cp ../jmeter/jmeter5.2/bin/system.properties.dist ../jmeter/jmeter5.2/bin/system.properties

echo "server.rmi.ssl.disable=true" >> ../jmeter/jmeter5.2/bin/jmeter.properties

echo "java.rmi.server.hostname=${IP}" >> ../jmeter/jmeter5.2/bin/system.properties

sed -i "s/#RMI_HOST_DEF=-Djava.rmi.server.hostname=xxx.xxx.xxx.xxx/RMI_HOST_DEF=-Djava.rmi.server.hostname=${IP}/g" ../jmeter/jmeter5.2/bin/jmeter-server

sed -i "s/-Xms1g -Xmx1g/-Xms${RAM}g -Xmx${RAM}g/g" ../jmeter/jmeter5.2/bin/jmeter
