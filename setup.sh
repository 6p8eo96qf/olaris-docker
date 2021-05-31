#!/bin/bash
wget -q https://downloads.rclone.org/v1.52.3/rclone-v1.52.3-linux-amd64.zip
unzip -q rclone-v1.52.3-linux-amd64.zip
export PATH=$PWD/rclone-v1.52.3-linux-amd64:$PATH
echo "Rclone config detected"
echo -e "$RCLONE_CONFIG" > ~/.config/rclone/rclone.conf
echo "Updating olaris-server from nightlies"
cd /opt
curl -vL 'https://gitlab.com/api/v4/projects/olaris%2Folaris-server/jobs/artifacts/develop/download?job=dist-linux-amd64' > /opt/build.zip && unzip -o /opt/build.zip && unzip "olaris-linux-amd64-*.zip"
