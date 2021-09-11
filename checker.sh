#!/bin/bash

## Health checker script

message=$(curl -m 6 -s http://3.129.198.184)

if [[ "$message" == *"This is sample content for the test"* ]]; then
  echo "[INFO] Website is there up and running"
else
  echo "[ERROR] Something is wrong"
fi

server_stat="$(ssh  -o ConnectTimeout=3  -o "StrictHostKeyChecking=no" -i "laksith.pem" ubuntu@3.129.198.184 "sudo /home/ubuntu/ssh_verify.sh" )"
if [[ "$server_stat" == *"Connection timed out"* ]]; then
   echo "Something is teribly wrong"
else
   echo "$server_stat"
fi
