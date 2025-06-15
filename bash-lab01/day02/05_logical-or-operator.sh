#!/bin/bash

# OR Operator

read -p "What is your age? " age
read -p "Your country: " country

# Convert the country input to lowercase
country=$(echo "$country" | tr '[:upper:]' '[:lower:]')

if [[ $age -ge 18 ]] || [[  $country == "india" ]]
then
	echo "You can vote"
else
	echo "You can't vote"
fi

