#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOF_FILE="LOGS_FOLDER/$SCRIPT_NAME.log"

USERID=$(id -u)

mkdir -p $LOGS_FOLDER
echo "scrip started executing at :$(date)"

if [USERID -ne 0 ]; then
    echo "ERROR: Please run the script with root user access"
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

dnf list installed mysql-server >> $LOG_FILE
if [ $? -nt 0 ]; then
    dnf install mysql-server -y >> $LOG_FILE
    VALIDATE $? "MYSQL"
else 
     echo -e "mysql server is already installed ... $G SKIPPING..$N"
fi



