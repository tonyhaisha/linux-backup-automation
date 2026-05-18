#!/bin/bash

REMOTE_USER="server"
REMOTE_HOST="192.168.100.11"

LOG="/var/log/restore_log.log"

echo '---------------------------------------------------------------------------------------' >> $LOG
echo $(date +'%F_%H-%M-%S') >> $LOG

echo "Enter the date of a needed backup(YYYY-MM-DD):"
read RESTORE_DATE
echo $RESTORE_DATE >> $LOG

echo 'Are you sure you want to restore to the' $RESTORE_DATE 'version? (y/n)'
read CONFIRMATION
echo $CONFIRMATION >> $LOG

if [ $CONFIRMATION == 'y' ]; then
	echo 'Starting restoration...' | tee -a $LOG
	rsync -avz $REMOTE_USER@$REMOTE_HOST:/home/server/backups/$RESTORE_DATE /$(whoami)/home/ |& tee -a $LOG
elif [ $CONFIRMATION == 'n' ]; then
	echo 'Restoration cancelled' | tee -a $LOG
	exit
else
	echo 'Invalid symbol' | tee -a $LOG
	exit
fi

echo 'Exit code:' $? >> $LOG 



