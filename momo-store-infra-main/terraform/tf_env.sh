#!/bin/bash

# About: This script exports variables for terraform
# Author: Konstantin Belopukhov

# Activate your profile in YC CLI
export yc config profile activate <your_yc_profile_name>

# Your IAM-token.
export TF_VAR_iam_token=$(yc iam create-token)

# S3 state saving access variables:
export TF_VAR_sa_access_key=<sa_secret_key_id>
export TF_VAR_sa_secret_key=<sa_secret_key_value>

# Optional variables. Uncomment and set your own values:

# ID of the target cloud. By default: b1g02u7oe05n4bt41qpi
export TF_VAR_cloud_id=b1g02u7oe05n4bt41qpi
# ID of the target folder. By default: b1glhqnn7s5p63026qgk
export TF_VAR_folder_id=b1glhqnn7s5p63026qgk
# ID of the target availability zone. By default: ru-central1-b
export TF_VAR_zone=ru-central1-b
