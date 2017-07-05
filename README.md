# Overview
This contain does several things:
* runs apache on port 80 to serve up all the mirrored content
* runs cron and once per day at 2am rerun the rsync from ftp.heanet.ie (currently hard coded, will parameterise)
* on container start run the rsync to build/update the local mirror

Since it is pretty bad practice to try and store the packages inside the container, it expects to mount a volume from the host

Note that as of July 2017 the mirror is ~111GB

# Execution
Make sure you have the latest image if you have run this before (note - docker run does not check for newer images):
`docker pull guyadams99/cygwin-mirror`

Then run:

`docker run -i -t -d -p <port you want to make available on>:80 -v <your host packages store>:/var/www/html guyadams99/cygwin-mirror`

e.g.

`docker run -i -t -d -p 8080:80 -v /tmp/cygwin/:/var/www/html guyadams99/cygwin-mirror`

All the rsync logs are stored in /var/logs/rsync.log

# Docker Registry
Find prebuilt container at: https://hub.docker.com/r/guyadams99/cygwin-mirror/
