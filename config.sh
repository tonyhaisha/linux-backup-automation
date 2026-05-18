#!/bin/bash

HOUR=0
MINUTES=0

echo "Please configure your desired time for automatic backups"
echo "Hour:"
read HOUR
echo "Minutes:"
read MINUTES

(crontab -l 2>/dev/null | grep -v "backup.sh"; echo $MINUTES $HOUR "* * * $PWD/backup.sh") | crontab -



echo "Backups are scheduled for" $HOUR':'$MINUTES "everyday and are sent to" $REMOTE_SERVER "as" $REMOTE_USER
