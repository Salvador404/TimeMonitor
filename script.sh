#!/bin/bash
total=100
#for changing your daily goal u can change (total) variable 

if [ -z "$1" ]; then
	echo "invalid usage";exit 2
fi




if [ -f ./temp.txt ]; then 
	rem="$(cat ./temp.txt | tr -d '\n')"
else
	printf '%s' $total > ./temp.txt
	rem=$total
fi


if [ $1 == "reset" ]; then
	printf '%s' $total > ./temp.txt;echo "program reset successfully";exit 0
elif [ $1 == "add" ]; then
	if [ -z "$2" ]; then
		echo "invalid usage , add needs numbers";exit 2
	fi
	if [ $2 -gt 0 ]; then
		if [ $2 -lt $rem ]; then
			rem=$(($rem - $2));echo "Goodjob! Today remainin time : $rem";exit 0
		else
			echo "invalid value";exit 2
		fi
	else
		echo "invalid value";exit 2
	fi
	
elif [ $1 == "finish" ]; then
	if [ -f ./alltime.txt ]; then 
		tmp="$(cat ./alltime.txt | tr -d '\n')"
		tmp=$(($rem + $tmp))
		printf '%s' $tmp > ./alltime.txt
		echo "Nice try ... today you pass $rem mins.total stack time is $tmp ... glhf!";exit 0
	else
		printf '%s' $rem > ./alltime.txt
		echo "Nice try ... today you pass $rem mins.total stack time is $rem ... glhf!";exit 0
	fi
elif [ $1 == "status" ]; then
	echo "to day remaining time : $rem";exit 0 

else
	echo "invalid argumant!";exit 2
fi



