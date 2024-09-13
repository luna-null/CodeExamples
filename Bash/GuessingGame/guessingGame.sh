#!usr/bin/env bash
# Guessing game test program for bash

maxTries=10


echo "Enter max number: "
read -r max

rng=$(date "+%N")
let "val = $rng % $max"

for (( i=0; i<="$maxTries"; i++ ))
do
	echo "Pick a number between 1 and $max: "
	read guess
	if [[ "$guess" -lt "$val" ]]; then
		echo "Too low!"
	elif [[ "$guess" -gt "$val" ]]; then
		echo "Too high!"
	else 
		echo "You win!"
		exit
	fi
done

echo "You lose! Number of tries exceeded!"
	
