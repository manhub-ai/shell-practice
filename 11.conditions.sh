#!/bin/bash

# This script checks if a number is even or odd
echo "Please enter the number:"
read NUMBER

if [ $NUMBER % 2 -eq 0 ] ; then
    echo "the given number $NUMBER is EVEN"
else
    echo "the given number $NUMBER is ODD"
fi