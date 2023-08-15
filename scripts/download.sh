#!/usr/bin/env bash

# Load environment variables from your ".env" file
set -o allexport
source .env
set +o allexport

set -eou pipefail

readonly LOCAL_DESTINATION_PATH="bucket"

echo "Recursively downloading new and updated files from your S3 bucket named \"${S3_BUCKET}\" to your local directory with the relative path \"${LOCAL_DESTINATION_PATH}/\"..."

set -x

aws s3 sync "s3://${S3_BUCKET}" "$LOCAL_DESTINATION_PATH" --delete

open "$LOCAL_DESTINATION_PATH"
tree -a "$LOCAL_DESTINATION_PATH"
du -h "$LOCAL_DESTINATION_PATH" | sort -h -r
