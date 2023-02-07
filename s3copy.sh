#!/bin/bash

# specify the source and destination regions
src_region="ap-southeast-1"
dst_region="us-east-1"

# list of source and destination buckets
buckets=(
  "emptybucketinsingpore123 testbucketinmubairegion123"
  "emptybucketinsingpore456 testbucketinmubairegion456"
)

# loop through the list of buckets
for bucket in "${buckets[@]}"; do
  # extract the source and destination bucket names
  src_bucket=$(echo $bucket | awk '{print $1}')
  dst_bucket=$(echo $bucket | awk '{print $2}')

  # list all objects in the source bucket and copy them to the destination bucket
  aws s3 ls s3://$src_bucket --region $src_region | awk '{print $4}' | xargs -I {} aws s3 cp s3://$src_bucket/{} s3://$dst_bucket/{} --region $src_region --region $dst_region

  # wait for the copy process to complete
  aws s3 ls s3://$dst_bucket --region $dst_region
done
