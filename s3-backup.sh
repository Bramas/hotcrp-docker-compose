#!/bin/bash

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")";

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE=backup_$DATE.sql

#create the backup file
docker-compose exec -T mysql mysqldump -uroot -proot hotcrp > $BACKUP_FILE

#upload it to S3
docker run --rm -i -v aws:/root/.aws -v $(pwd):/aws amazon/aws-cli s3 cp $BACKUP_FILE s3://opodis-backup

rm $BACKUP_FILE
