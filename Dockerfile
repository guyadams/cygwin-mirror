FROM ubuntu:16.04



RUN apt-get update
RUN apt-get -y install rsync python-pip python-dev build-essential git apache2 vim cron

ADD rsync.sh /bin/rsync.sh
ADD start.sh /bin/start.sh
RUN chmod 777 /bin/rsync.sh
RUN chmod 777 /bin/start.sh

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/rsync-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/rsync-cron

# Create the log file to be able to run tail
RUN touch /var/log/rsync.log

CMD /bin/start.sh

