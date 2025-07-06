#!/bin/sh

if [ -z "$ANDREWWILLETTE_PUBLIC_IP" ]; then
  echo "Error: ANDREWWILLETTE_PUBLIC_IP environment variable is not set."
  exit 1
fi

ssh ubuntu@"$ANDREWWILLETTE_PUBLIC_IP" 'sudo less /home/ubuntu/server.log'
