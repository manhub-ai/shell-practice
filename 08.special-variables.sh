#!/bin/bash

echo "All variables passed to the script: $@"
echo "All varaibles passed to the script: $*"
echo "Script name $0"
echo "Current directoty: $PWD"
echo "Who is running the script: $USER"
echo "Home directoty of the user: $HOME"
echo "PID of this script: $$"
sleep 15 &
echo "PID of the last command in the background: $!"
echo "Total number of arguments passed to the script: $#"