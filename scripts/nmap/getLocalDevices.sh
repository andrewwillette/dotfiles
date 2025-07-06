#!/bin/sh

localIp=$(ifconfig|grep -A 7 en0:|grep -o -E 'inet [1-9]{1,3}\.[1-9]{1,3}\.[1-9]{1,3}\.[1-9]{1,3}'|grep -o -E '[1-9]{1,3}\.[1-9]{1,3}\.[1-9]{1,3}\.[1-9]{1,3}')
echo $localIp
# nmap -sP 172.19.131.0/2e
