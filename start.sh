#!/bin/bash
# set rsync going in the background
echo "Starting rsync in background...."
/bin/rsync.sh & 

# run apache
service apache2 start 

# run cron
service cron start 

# shell to connect to
/bin/bash
