#!/bin/sh
aws s3 mb s3://bildverkleinerungs-upload
aws s3 mb s3://bildverkleinerungs-output

aws lambda 