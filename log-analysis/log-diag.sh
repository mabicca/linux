#!/bin/bash
find /var/log -exec egrep -i -H failed\|error\|tainted\|lock {} \; | uniq >> /tmp/diag-logs.txt
echo ================================================================== >> /tmp/diag-logs.txt
waagent -show-configuration >> /tmp/diag-logs.txt
echo ================================================================== >> /tmp/diag-logs.txt
cat /etc/fstab >> /tmp/diag-logs.txt
echo ================================================================== >> /tmp/diag-logs.txt
sysctl -a >> /tmp/diag-logs.txt
echo ================================================================== >> /tmp/diag-logs.txt


