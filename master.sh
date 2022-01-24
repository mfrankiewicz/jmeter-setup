#!/bin/bash

source common.sh

apt install -y python3 python3-tk python3-pip python3-dev python3-aiomeasures libxml2-dev libxslt-dev zlib1g-dev

python3 -m pip install bzt
