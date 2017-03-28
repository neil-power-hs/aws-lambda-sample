# Boto script for invoking: http://docs.aws.amazon.com/cli/latest/reference/lambda/create-alias.html

import json
import sys

import boto3
import yaml

if len(sys.argv) != 5:
    raise Exception("Invalid Usage")

environment = str(sys.argv[1])
version = str(sys.argv[2])
aliasName = str(sys.argv[3])
functionVersion = str(sys.argv[4])

stream = file('../aws_credentials.yml', 'r')
keys = yaml.load(stream)

if environment == 'production':
    access_key = keys['production_access_key']
    secret_key = keys['production_secret_key']
else:
    access_key = keys['staging_access_key']
    secret_key = keys['staging_secret_key']

if aliasName == '' or functionVersion == '':
    raise Exception("Please set <aliasName> and <lambdaVersion> gradle project properties")

session = boto3.Session(aws_access_key_id=access_key,
                        aws_secret_access_key=secret_key,
                        region_name="us-east-1")

client = session.client('lambda')

response = client.create_alias(
    FunctionName="sampleLambda_" + environment,
    Name=aliasName,
    FunctionVersion=functionVersion,
    Description="Lambda Version: " + version
)

print json.dumps(response, sort_keys=True, indent=4, separators=(',', ': '))
