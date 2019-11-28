#!/bin/bash

output=$(systemctl status nfs|grep inactive)

if [ systemctl status nfs|grep inactive ]; then
systemctl restart nfs
fi
