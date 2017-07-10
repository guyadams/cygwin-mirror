#!/bin/bash
date > /var/log/rsync.log 2>&1
rsync -vaz rsync://ftp.heanet.ie/pub/cygwin/ /var/www/html > /var/log/rsync.log 2>&1
