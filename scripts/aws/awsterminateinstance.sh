#!/bin/sh
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./awsterminateinstance.sh instanceID

Terminate EC2 instance <instanceID> on AWS.

'
    exit
fi

if [ $# -eq 0 ]; then
    echo "No EC2 instanceID provided"
    exit 1
fi

aws ec2 terminate-instances --instance-ids $1
