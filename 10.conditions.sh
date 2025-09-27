#!/bin/bash

# This script checks if the given number is greater than, less than or equal to 10
NUMBER=$1

if [ $NUMBER -lt 0 ] ; then
    echo "The given number $NUMBER is grater than 10"
elif [ $NUMBER -eq 10 ] ; then
    echo "The given number $NUMBER is equal to 10"
else
    echo "The given number $NUMBER is grater than 10"
fi