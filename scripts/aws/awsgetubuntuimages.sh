#!/bin/sh
aws ec2 describe-images \
  --owners "099720109477" \
  --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-*" \
