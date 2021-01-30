#!/bin/bash

read -p "Enter the number of bits: "$'\n' bits
read -p "Enter the type of key to create (dsa, ecdsa, ed25519 or rsa): "$'\n' type
read -p "Enter the filename: "$'\n' filename

ssh-keygen -b $bits -t $type -f $filename
