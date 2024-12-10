#!/bin/bash

# create backup (PROD ENV)

SSH_KEY="/home/ntz/adlaferroviaria/adf-setup/src/sshs/sb-c002-int_key.pem"
BACKUP_FILE="/home/ntz/adlaferroviaria/adf-landing/src/backups/dev-block-auth-io-20241021-091000-dwsf1c2wtgbd.wpress"
DESTINATION_PATH="/home/ntz/adlaferroviaria/adf-setup/"
VM_USER="ntz"
VM_IP="20.56.149.164"
# restore backup
BACKUP_FILE_UPLOADED="/home/ntz/adlaferroviaria/adf-setup/dev-block-auth-io-20241021-091000-dwsf1c2wtgbd.wpress"
WP_CONTAINER="adf-landing-wp"
WP_BACKUP_PATH="/var/www/html/wp-content/ai1wm-backups/"

echo "[ba] Uploading backup to VM..."
scp -i $SSH_KEY $BACKUP_FILE $VM_USER@$VM_IP:$DESTINATION_PATH
echo "[ba] Backup DONE!"

# connect to VM and run into docker container
ssh -i $SSH_KEY $VM_USER@$VM_IP
cd $DESTINATION_PATH
docker cp $BACKUP_FILE_UPLOADED $WP_CONTAINER:$WP_BACKUP_PATH
