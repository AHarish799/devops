#!/bin/bash
RIGIONS=$@
for REGION in ${RIGIONS}; do
    echo "lets get the vpc id for Region $REGION"
    aws ec2 describe-vpcs --region $REGION --output $FORMAT | jq ".Vpcs[].Vpcid"
    echo '------------------------------------------------------------------------------'
done
