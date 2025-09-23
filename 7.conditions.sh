#!/bin/bash

# Please validate the input number and print the output as below.


NUMBER=$1

if [ $NUMBER -lt 25 ]; then
    echo "The given number #NUMBER is less than 25"
elif [ $NUMBER -eq 25 ]; then
    echo "the given number #NUMBER is equal to 25"
else [ $NUMBER -gt 25 ]; then 
    echo "the given number #NUMBER is greater than 25"
fi

