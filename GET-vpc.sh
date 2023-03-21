#!/bin/bash
REGION='us-east-1'
FORMAT='json'
aws ec2 describe-vpcs --region $REGION --OUTPUT $FORMAT | ".Vpcid"