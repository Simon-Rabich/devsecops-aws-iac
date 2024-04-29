#!/bin/bash

# Variables
bucket_name="static-website-bucket-simon"
cf_stack_name="EC2"
cf_template_path="/Users/simonravitz/Desktop/DevSecOps/CourseTrainings/AWS-Practitioner/FinalProjectYamlStacks/Stack3-EC2"

# Upload files to S3
aws s3 cp /Users/simonravitz/Desktop/DevSecOps/CourseTrainings/AWS-Practitioner/FinalProjectYamlStacks/resources/index.html s3://${bucket_name}/index.html
aws s3 cp /Users/simonravitz/Desktop/DevSecOps/CourseTrainings/AWS-Practitioner/FinalProjectYamlStacks/resources/architecture-diagram.png s3://${bucket_name}/architecture-diagram.png
aws s3 cp /Users/simonravitz/Desktop/DevSecOps/CourseTrainings/AWS-Practitioner/FinalProjectYamlStacks/resources/webpage2 s3://${bucket_name}/webpage2 --recursive

# Deploy the CloudFormation stack
aws cloudformation deploy \
    --template-file ${cf_template_path} \
    --stack-name ${cf_stack_name} \
    --parameter-overrides BucketName=${bucket_name} \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
    --no-fail-on-empty-changeset

echo "Deployment triggered..."

