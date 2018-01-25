#!/bin/bash

sudo nohup /opt/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 >> nohup.out 2>&1 &

sleep 5

echo "All done"


