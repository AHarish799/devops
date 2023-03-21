#!/bin/bash
REGIONS=$@
for REGION in ${REGIONS}; do
    echo "lets get the vpc id for Region $REGION"
    aws ec2 describe-vpcs --region $REGION --output json | jq ".Vpcs[].VpcId"
    echo '------------------------------------------------------------------------------'
done
