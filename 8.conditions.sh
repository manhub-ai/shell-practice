#!/bin/bash

echo "please enter a number:"
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "the entered Number $NUMBER is even"
else
    echo "the entered number $NUMBER is odd"
fi