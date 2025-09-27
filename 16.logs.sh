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



LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

echo "script started at: $(date)" &>> $LOG_FILE
if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script as root or using sudo"
    exit 1
fi

VALIDATE(){ #functions receive inputs through arguments just like scripts
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "installing $2 ... $G SUCCESS $N"
    fi
}

dnf list installed mysql &>> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? "Mysql"
else
    echo -e "Mysql is already installed ...$Y SKIPPING... $N"
fi

dnf list installed nginx &>> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx is already installed ...$Y SKIPPING... $N"
fi

dnf list installed python3 &>> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>> $LOG_FILE
    VALIDATE $? "Python3"
else
    echo -e "Python3 is already installed ...$Y SKIPPING... $N"
fi
