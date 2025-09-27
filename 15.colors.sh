#!/bin/bash

#check if user is root or not
USERID=$(id -u)
# Colour Variables
R="\e[31m"
G="\e[32m"
Y="\e[33m"      
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script as root or using sudo"
    exit 1
fi

VALIDATE(){ #functions receive inputs through arguments just like scripts
    if [ $1 -ne 0 ]; then
        echo "installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo "installing $2 ... $G SUCCESS $N"
    fi
}


dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "Mysql"
else
    echo -e "Mysql is already installed ...$Y SKIPPING... $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx is already installed ...$Y SKIPPING... $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo -e "Python3 is already installed ...$Y SKIPPING... $N"
fi