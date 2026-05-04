#!/bin/bash

BACKUP_DIRS=("/home/$(whoami)/")
REMOTE_USER="server"
REMOTE_HOST="192.168.100.11"
REMOTE_PORT="22"


SSH_KEY_PATH="$HOME/.ssh/id_ed25519"

LOG="var/log/scheduled_backup.log"

echo "BACKUP STARTED" >> LOG
echo $(date "+%d-%m-%Y") >> LOG

sudo rsync -avz /home/ashen/ server@UbuntuBackups:/home/server/backups/$(date +"%F_%H-%M-%S")










