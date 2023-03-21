#!/bin/bash
REGION='us-east-1'
FORMAT='JOSN'
aws ec2 describe-vpcs --region $REGION --OUTPUT $FORMAT | ".vpcid"