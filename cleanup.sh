#!/bin/sh
aws s3 rb s3://bildverkleinerungs-upload --force 
aws s3 rb s3://bildverkleinerungs-output --force
aws s3 ls 