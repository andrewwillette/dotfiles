#!/bin/sh
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./awslaunchkali.sh

Launch a Kali Linux instance on AWS EC2.

'
    exit
fi

aws ec2 run-instances --image-id ami-074a40db14b13f92f --count 1 --instance-type t2.micro --key-name willette-key --security-group-ids sg-0582f245f931c4d00 --subnet-id subnet-3935b375 --block-device-mapping "[ { \"DeviceName\": \"/dev/xvda\", \"Ebs\": { \"VolumeSize\": 30 } } ]"
