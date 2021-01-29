#!/bin/bash

# --recursive tell AWS CLI to apply the operation recursively to multiple objects, s3://bucket-name/ points to the s3 bucket, /home/aishwarya.ms/... 
# specifies the location on my server where I want these emails to be stored, --profile specifies which AWS account to use
aws s3 cp --recursive s3://bucket-name/ /home/aishwarya.ms/s3-emails/temporary-emails/ --profile myaccount

# tmp_file_location is where the emails will be copied from s3
tmp_file_location=/home/aishwarya.ms/s3-emails/temporary-emails/*

# base_location makes a few modifications and stores the data in an organised manner
base_location=/home/aishwarya.ms/s3-emails/emails/

# today is the name of the new folder that has to be created. To keep the name of the folder unique, we use the date
today=$(date +"%m_%d_%Y")

# Check if a directory with name $today is present. If it's not present then create a new directory with the name as $today
[[ -d ${base_location}/"$today" ]] || mkdir ${base_location}/"$today"

# Loop through each of the files in $tmp_file_location and rename them to make more sense. AWS names the files in a very confusing way, hence this step
for FILE in $tmp_file_location
do
   mv $FILE ${base_location}/${today}/email$(rand)
done
