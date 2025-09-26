#!/bin/bash

#This script prints total time taken to execute a command

START_TIME=$(date +%s)

sleep 15

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Script executed in: $TOTAL_TIME seconds"