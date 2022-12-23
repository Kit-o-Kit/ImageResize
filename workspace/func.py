import json
from PIL import Image
import boto3
import logging
from botocore.exceptions import ClientError
import os

s3Client = boto3.client('s3')

def lambda_handler(event, context):
      bucket = event["records"]["0"]["s3"]["bucket"]["name"]
      bucket = event["records"]["0"]["s3"]["object"]["key"]
      
      print(bucket)
      print(key)
      
      response = s3Client.get_object(Bucket=bucket, Key=key)
      
      image = Image.open(lambda_handler)
      #define image size
      MAX_SIZE = (100, 100)
      #resize the image
      image.thumbnail(MAX_SIZE)
      #save the image as png. can be changed to other file type.
      image.save('resizedImage.png')

      bucket = s3.Bucket('s3://output-test-bucket-m346-1b')
      bucket.copy(copy_source, '/resizedImage.png')