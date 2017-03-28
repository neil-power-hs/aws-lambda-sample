import json
import sys

import boto3

if len(sys.argv) != 3:
    raise Exception("Invalid Usage")

bucket_name = str(sys.argv[1])
folder_name = str(sys.argv[2])


def get_key(line):
    return line.split("=")[1].strip().strip("\"")

with open('../aws_secrets.tfvars') as f:
    lines = f.readlines()

access_key = get_key(lines[0])
secret_key = get_key(lines[1])

session = boto3.Session(aws_access_key_id=access_key,
                        aws_secret_access_key=secret_key,
                        region_name="us-east-1")

client = session.client('s3')

response = client.create_bucket(Bucket=bucket_name)

print json.dumps(response, sort_keys=True, indent=4, separators=(',', ': '))

response = client.put_object(
    Bucket=bucket_name,
    Body='',
    Key=folder_name)

print json.dumps(response, sort_keys=True, indent=4, separators=(',', ': '))
