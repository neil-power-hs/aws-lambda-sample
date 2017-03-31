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
                "arn:aws:lambda:${region}:${account}:function:sampleLambda_${env}"
            ]
        }
    ]
}
