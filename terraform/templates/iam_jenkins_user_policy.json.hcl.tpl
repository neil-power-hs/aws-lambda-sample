{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowGroupToSeeBucketListInTheConsole",
            "Action": [
                "s3:ListAllMyBuckets",
                "s3:GetBucketLocation"
            ],
            "Effect": "Allow",
            "Resource": [
            "arn:aws:s3:::*"
            ]
        },
        {
            "Sid": "AllowRootLevelListingOfTheBucket",
            "Action": [
                "s3:ListBucket",
                "s3:ListBucketVersions"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::${bucket}"
            ]
        },
        {
            "Sid": "AllowUserSpecificActionsOnlyInSharedFolder",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:GetObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::${bucket}/sample_lambda/${env}/*"
            ]
        },
        {
            "Sid": "Stmt1477062504000",
            "Effect": "Allow",
            "Action": [
                "lambda:CreateAlias",
                "lambda:DeleteAlias",
                "lambda:GetAlias",
                "lambda:ListAliases",
                "lambda:ListVersionsByFunction",
                "lambda:PublishVersion",
                "lambda:UpdateAlias",
                "lambda:UpdateFunctionCode"
            ],
            "Resource": "arn:aws:lambda:${region}:${account}:function:sampleLambda_${env}"
        }
    ]
}
