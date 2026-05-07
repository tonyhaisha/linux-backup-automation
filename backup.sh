#!/bin/bash

REMOTE_USER="server"
REMOTE_HOST="192.168.100.11"

SSH_KEY_PATH="$HOME/.ssh/id_ed25519"

LOG="/var/log/scheduled_backup.log"

echo "BACKUP STARTED" >> $LOG
echo $(date "+%d-%m-%Y") >> $LOG

sudo rsync -avz /home/ashen/ $REMOTE_USER@$REMOTE_HOST:/home/server/backups/$(date +"%F_%H-%M-%S") >> $LOG

echo $?

echo "BACKUP SUCCESSFUL!" >> $LOG

