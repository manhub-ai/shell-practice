#!/bin/bash

NUMBER1=10
NUMBER2=20
NAME="Manju"

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "Sum is $SUM"

# Size=4, Max index=5
CRICKET_TEAM=("Abshick" "Dhoni" "Kohli" "Rohit" "Jadeja")
echo "Players in the team are: ${CRICKET_TEAM[@]}"
echo "Captain of the team is: ${CRICKET_TEAM[2]}"
echo "Wicket keeper of the team is: ${CRICKET_TEAM[1]}"
echo "Bowler of the team is: ${CRICKET_TEAM[4]}"
echo "First slip fielder of the team is: ${CRICKET_TEAM[0]}"