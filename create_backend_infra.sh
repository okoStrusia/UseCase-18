#!/bin/bash

# Replace these values with your own
AWS_PROFILE=""
AWS_REGION="us-east-1"
AWS_USER="" # whole arn
S3_BUCKET_NAME=""
DYNAMODB_TABLE_NAME=""
BUCKET_POLICY=$(cat <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": $AWS_USER
      },
      "Action": [
        "s3:ListBucket",
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": [
        "arn:aws:s3:::$S3_BUCKET_NAME",
        "arn:aws:s3:::$S3_BUCKET_NAME/*"
      ]
    }
  ]
}
EOF
)

# Create S3 Bucket
aws s3api create-bucket \
    --profile "$AWS_PROFILE" \
    --bucket "$S3_BUCKET_NAME" \
    --region "$AWS_REGION" 
aws s3api put-bucket-policy \
    --profile "$AWS_PROFILE" \
    --bucket "$S3_BUCKET_NAME" \
    --policy "$BUCKET_POLICY"
# Create DynamoDB Table
aws dynamodb create-table \
    --profile "$AWS_PROFILE" \
    --table-name "$DYNAMODB_TABLE_NAME" \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region "$AWS_REGION"

echo "Backend infrastructure created successfully!"

echo "Now you can run 'terraform init'"