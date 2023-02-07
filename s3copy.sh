#!/bin/bash

# List of source S3 buckets to copy
buckets=(
  "singapoebucket1"
  "singapoebucket2"
)

# Source region
src_region="ap-southeast-1"

# Target region
target_region="us-east-1"

# Loop through the list of source buckets
for bucket in "${buckets[@]}"; do
  echo "Copying $bucket from $src_region to $target_region..."

  # Check if the target bucket already exists
  target_bucket="$bucket-target"
  if aws s3 ls "s3://$target_bucket" --region "$target_region" &> /dev/null; then
    echo "Target bucket $target_bucket already exists. Skipping..."
    continue
  fi

  # Create the target bucket
  aws s3 mb "s3://$target_bucket" --region "$target_region"

  # Copy all objects from the source bucket to the target bucket
  aws s3 cp "s3://$bucket" "s3://$target_bucket" --recursive --region "$src_region"
done

echo "Done!"
































#
## specify the source and destination regions
#src_region="ap-southeast-1"
#dst_region="us-east-1"
#
## list of source and destination buckets
#buckets=(
#  "singapoebucket1 mumbbuck1
#  singapoebucket2 mumbbuck2"
#)
#
#buckets=("singapoebucket1" "mumbbuck1" "singapoebucket2"  "mumbbuck2")
#
#
#for index in "${!buckets[@]}";
#do
#    echo "${buckets[$index]} ====> ${buckets[$index + 1]}"
#     index + 1
#done
#
#
## loop through the list of buckets
##for bucket in "${buckets[@]}"; do
##  # extract the source and destination bucket names
##  src_bucket=$(echo $bucket | awk '{print $1}')
##  dst_bucket=$(echo $bucket | awk '{print $2}')
##
##  # list all objects in the source bucket and copy them to the destination bucket
##  aws s3 ls s3://$src_bucket --region $src_region | awk '{print $4}' | xargs -I {} aws s3 cp s3://$src_bucket/{} s3://$dst_bucket/{} --region $src_region --region $dst_region
##
##  # wait for the copy process to complete
##  aws s3 ls s3://$dst_bucket --region $dst_region
##done
#
#
#
#
### Define source and destination regions
##src_region="ap-southeast-1"
##dst_region="us-east-1"
##
### List all buckets in the source region
##buckets=$(aws --region $src_region s3 ls | awk '{print $3}')
##
### Loop through each bucket and copy it to the destination region
##for bucket in $buckets; do
##
##    aws s3 cp s3://$bucket s3://$bucket --recursive --region $src_region --region $dst_region
##
##done
