#!/bin/bash

REMOTE_USER="server"
REMOTE_HOST="192.168.100.11"

LOG="/var/log/scheduled_backup.log"

echo "-----------------------------------------------------------------------------------" >> $LOG
echo $(date +"%F_%H-%M-%S") >> $LOG

echo "BACKUP STARTED" | tee -a $LOG

rsync -avz /home/ashen/ $REMOTE_USER@$REMOTE_HOST:/home/server/backups/$(date +"%F") | tee -a $LOG

echo 'Exit code' $? >> $LOG
