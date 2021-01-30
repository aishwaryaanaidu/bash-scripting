#!/bin/bash

# Taking the number of bits, type of key and filename from the user
read -p "Enter the number of bits: "$'\n' bits
read -p "Enter the type of key to create (dsa, ecdsa, ed25519 or rsa): "$'\n' type
read -p "Enter the filename: "$'\n' filename

# Using ssh-keygen and passing the values entered by the user to generate a public and private key pair
ssh-keygen -b $bits -t $type -f $filename
