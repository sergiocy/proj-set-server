#!/bin/bash

#### ...by default ubuntu set 2Gb of swap memory...

#### ...stop swap...
sudo swapoff -a
#### ...set size swap...
sudo fallocate -l 10G /swapfile
#### ...set permission...
sudo chmod 600 /swapfile
#### ...set file as swap memory...
sudo mkswap /swapfile
#### ...start swap memory...
sudo swapon /swapfile
#### ...check new swap...
sudo swapon -s
