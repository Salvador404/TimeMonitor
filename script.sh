#!/bin/bash
total=100
#for changing your daily goal u can change (total) variable 

if [  ]; then 




if [ -f ./temp.txt ]; then 
	rem="$(cat ./temp.txt | tr -d '\n')"
else
	echo -n $total > ./temp.txt
	rem=$total
fi


if [ $1 == "reset" ]; then
	echo -n $total > ./temp.txt;echo "program reset successfully";exit 0
elif [ $1 == "add" ]; then
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
		echo -n $tmp > ./alltime.txt
		echo "Nice try ... today you pass $rem mins.total stack time is $tmp ... glhf!";exit 0
	else
		echo -n $rem > ./alltime.txt
		echo "Nice try ... today you pass $rem mins.total stack time is $rem ... glhf!";exit 0
	fi
elif [ $1 == "status" ]; then
	echo "to day remaining time : $rem";exit 0 

else
	echo "invalid argumant!";exit 2
fi



