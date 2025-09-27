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

echo "script started at: $(date)" | tee -a $LOG_FILE
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

for package in "$@"
do
    #check package is already installed or not
    dnf list installed $package &>>$LOG_FILE
    
    #if exit status is 0 the already installed, if -ne 0 then need to install
    if [ $? -ne 0 ]; then
        dnf install "$package" -y $>>&LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package are already installed ... $Y SKIPPING $N" 
    fi   
done