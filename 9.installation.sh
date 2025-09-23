#!/bin/bash

USERID=$(id -u)

if [ USERID -ne 0 ]; then
    echo "ERROR: Please run this ecipt with an root user access"
    exit 
fi

dnf install mysql-server -y

if [ $? -ne 0]; then
    echo "ERROR: Script execution failed"
    exit 
else
    echo "mysql-server has been installed successfully"
fi
