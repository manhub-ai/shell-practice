#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
N="\e[0m"

USERID=$(id -u)

if [ USERID -ne 0 ]; then
    echo "ERROR: Please run this ecipt with an root user access"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0]; then
        echo -e "ERROR: $2 Script execution $R failed $N"
        exit 1
    else
     echo -e " $2 has been installed $G successfully $N"
    fi
}

dnf list installed mysql-server
if [ $? -nt 0 ]; then
    dnf install mysql-server -y
    VALIDATE $? "MYSQL"
else 
     echo -e "mysql server is already installed ... $G SKIPPING..$N"
fi



dnf list installed nginx
if [ $? -ne 0 ]; then  
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx is already installed ...$G SKIPPING $N"
fi

dnf list installed python3
if [$? -ne 0]; then
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo -e "python3 has already installed ... $G SKIPPING $N"
fi