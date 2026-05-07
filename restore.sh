#!/bin/bash

REMOTE_USER="server"
REMOTE_HOST="192.168.100.11"

LOG="/var/log/restore_log.log"

echo "Enter the date of a needed backup:"
read RESTORE_DATE

echo 'Are you sure you want to restore to the' $RESTORE_DATE 'version?'



