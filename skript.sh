#!/bin/sh
aws s3 mb s3://bildverkleinerungs-upload
aws s3 mb s3://bildverkleinerungs-output

zip bildverkleinern.zip index.js
aws lambda create-function --function-name bildverkleinern --zip-file fileb://bildverkleinern.zip --handler index.handler --runtime nodejs16.x --role arn:aws:iam::490096896432:role/LabRole