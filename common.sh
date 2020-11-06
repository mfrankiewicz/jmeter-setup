#!/bin/bash

git clone git@github.com:wiosna-dev/jmeter.git ../jmeter

cp ../jmeter/jmeter5.2/bin/jmeter.dist ../jmeter/jmeter5.2/bin/jmeter

cp ../jmeter/jmeter5.2/bin/jmeter.properties.dist ../jmeter/jmeter5.2/bin/jmeter.properties

cp ../jmeter/jmeter5.2/bin/system.properties.dist ../jmeter/jmeter5.2/bin/system.properties

echo "server.rmi.ssl.disable=true" >> ../jmeter/jmeter5.2/bin/jmeter.properties

IP=$(ifconfig | grep -Eo 'inet 10\.114\.0\.[0-9]{1,3}' | grep -o [0-9].*)
RAM=$(cat /proc/meminfo | grep MemTotal | grep -o '[[:digit:]]*')
RAM=$(($RAM/1024/1024))
