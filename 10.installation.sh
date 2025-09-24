#!/bin/bash

USERID=$(id -u)

if [ USERID -ne 0 ]; then
    echo "ERROR: Please run this ecipt with an root user access"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0]; then
        echo "ERROR: $2 Script execution failed"
        exit 1
    else
     echo " $2 has been installed successfully"
    fi
}

dnf install mysql-server -y
VALIDATE $? "MYSQL"


dnf install nginx -y
VALIDATE $? "Nginx"


dnf install python3 -y
VALIDATE $? "Python3"