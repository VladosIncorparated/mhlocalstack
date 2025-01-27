#!/bin/bash
# awslocal iam create-user --user-name uplader
# awslocal iam create-access-key --user-name uplader

awslocal s3 mb s3://my-local-bucket

aws --endpoint-url=http://localhost:4566 s3api put-bucket-cors --bucket my-local-bucket --cors-configuration '
{
 "CORSRules":
	[
	  {
		"ID": "start",
		"AllowedOrigins": ["http://localhost:8080"],
		"AllowedMethods": ["GET"],
		"AllowedHeaders": ["*"],
		"MaxAgeSeconds": 3000
	  }
	]
}
'

# file://etc/localstack/init/ready.d/cors.json 
# awslocal s3api put-bucket-policy --bucket my-local-bucket --policy '{
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#           "Effect": "Allow",
#           "Principal": "*",
#           "Action": "s3:GetObject",
#           "Resource": [
#             "arn:aws:s3:::my-local-bucket/*"
#           ],
#           "Condition": {
#             "Bool": {
#               "aws:Authenticated": "true"
#             }
#           }
#         },
#         {
#           "Effect": "Allow",
#           "Principal": "*",
#           "Action": "s3:*",
#           "Resource": [
#             "arn:aws:s3:::my-local-bucket/*"
#           ],
#           "Condition": {
#             "Bool": {
#               "aws:Authenticated": "true"
#             }
#           }
#         }
#     ]
# }
# '