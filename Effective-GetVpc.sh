#!/bin/bash
REGIONS=$@
for REGION in ${REGIONS};
 do
    echo "lets get the vpc id for Region $REGION"
    aws ec2 describe-subnets --region $REGION --output json | jq ".Subnets[] | .VpcId, .SubnetId, .State"
    echo '------------------------------------------------------------------------------'
done
