#!/bin/bash
clear
HOST_ADDR=$(hostname -I)
echo 'Running on '$HOST_ADDR
sudo iftop -P -t -n | awk -v h=$HOST_ADDR -f addrs.awk
