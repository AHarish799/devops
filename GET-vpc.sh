#!/bin/bash
REGION=$1
FORMAT='json'
echo "Lets get the vpc details from The Region "
aws ec2 describe-vpcs --region $REGION --output $FORMAT | jq ".Vpcs[].Vpcid"