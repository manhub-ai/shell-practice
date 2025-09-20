#!/bin/bash

START_TIME=$(date +%s)
 
sleep 10

END_TIME=$(date +%s)

TOTAL_TIME=$((END_TIME-START_TIME))

echo "total time taken to execute the script: $TOTAL_TIME seconds"
echo " script executed successfully"
