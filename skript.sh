#!/bin/sh
aws s3 mb s3://bildverkleinerungs-upload
aws s3 mb s3://bildverkleinerungs-output

sudo zip bildverkleinern.zip index.js
aws lambda create-function --function-name bildverkleinern --zip-file fileb://bildverkleinern.zip --handler index.handler --runtime nodejs16.x --role arn:aws:iam::490096896432:role/LabRole

sudo touch output.json
sudo chmod a+rwx output.json
aws lambda get-function --function-name bildverkleinern > output.json

aws lambda add-permission --function-name bildverkleinern --action lambda:InvokeFunction --principal s3.amazonaws.com --source-arn arn:aws:s3:::bildverkleinerungs-upload --statement-id 1
aws lambda get-policy --function-name bildverkleinern
aws lambda remove-permission --function-name bildverkleinern --statement-id 1

aws s3api put-bucket-notification-configuration --bucket bildverkleinerungs-upload --notification-configuration file://notification.json    
arn:aws:lambda:us-east-1:490096896432:function:bildverkleinern
