#!/bin/bash
REGION='us-east-1'
aws ec2 describe-vpcs --region $REGION | ".vpcid"