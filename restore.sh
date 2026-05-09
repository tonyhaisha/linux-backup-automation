#!/bin/bash

REMOTE_USER="server"
REMOTE_HOST="192.168.100.11"

LOG="/var/log/restore_log.log"

echo "Enter the date of a needed backup(YYYY-MM-DD):"
read RESTORE_DATE

echo 'Are you sure you want to restore to the' $RESTORE_DATE 'version? (y/n)'
read CONFIRMATION

if [ $CONFIRMATION == 'y' ]; then
	echo 'Starting restoration...'
	rsync --dry-run -avz $REMOTE_USER@$REMOTE_HOST:/home/server/backups/$RESTORE_DATE /$(whoami)/home/
elif [ $CONFIRMATION == 'n' ]; then
	echo 'Restoration cancelled'
	exit
else
	echo 'Invalid symbol'
	exit
fi


