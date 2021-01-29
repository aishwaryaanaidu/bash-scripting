#!/bin/bash
aws s3 cp --recursive s3://bucket-name/ /home/aishwarya.ms/s3-emails/temporary-emails/ --profile myaccount

tmp_file_location=/home/aishwarya.ms/s3-emails/temporary-emails/*
base_location=/home/aishwarya.ms/s3-emails/emails/

today=$(date +"%m_%d_%Y")
[[ -d ${base_location}/"$today" ]] || mkdir ${base_location}/"$today"

for FILE in $tmp_file_location
do
   mv $FILE ${base_location}/${today}/email$(rand)
done
