#!/bin/bash

REMOTE_USER="server"
REMOTE_HOST="192.168.100.11"
SOURCE_DIR="$HOME"
BACKUP_DIR="/home/server/backups/"

LOG="/var/log/scheduled_backup.log"

echo "-----------------------------------------------------------------------------------" >> $LOG
echo $(date +"%F_%H-%M-%S") >> $LOG

echo "BACKUP STARTED" | tee -a $LOG

rsync -avz $SOURCE_DIR $REMOTE_USER@$REMOTE_HOST:$BACKUP_DIR$(date +"%F") 2>&1 | tee -a $LOG

echo 'Exit code' $? >> $LOG
