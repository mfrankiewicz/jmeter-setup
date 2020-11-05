#!/bin/bash

cd ..

git clone git@github.com:wiosna-dev/jmeter.git

cp jmeter/jmeter5.2/bin/jmeter.dist jmeter/jmeter5.2/bin/jmeter

cp jmeter/jmeter5.2/bin/jmeter.properties.dist jmeter/jmeter5.2/bin/jmeter.properties

cp jmeter/jmeter5.2/bin/system.properties.dist jmeter/jmeter5.2/bin/system.properties

echo "server.rmi.ssl.disable=true" >> jmeter/jmeter5.2/bin/jmeter.properties
