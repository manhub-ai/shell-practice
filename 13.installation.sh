#!/bin/bash

#check if user is root or not
USERID=$(id -u)

if [$USERID -ne 0 ]; then
    echo "ERROR: Please run this script as root or using sudo"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR: $2 installation failed"
        exit 1
    else
        echo "$2 installed successfully"
    fi
}

#Installling MySQL 
dnf install mysql -y
VALIDATE $? "Mysql"


#Installling Nginx 
dnf install nginx -y
VALIDATE $? "Nginx"

#Installling MySQL 
dnf install python3 -y
VALIDATE $? "Python3"
