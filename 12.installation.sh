#!/bin/bash

#check if user is root or not
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script as root or using sudo"
    exit 1
fi

#Installling MySQL 

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR: Mysql installation failed"
    exit 1
else
    echo "Mysql installed successfully"
fi
