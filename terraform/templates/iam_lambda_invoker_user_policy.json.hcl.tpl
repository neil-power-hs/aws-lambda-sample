{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "LambdaInvoke",
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction"
            ],
            "Resource": [
                "arn:aws:lambda:us-east-1:372111772233:function:sampleLambda_${env}"
            ]
        }
    ]
}
