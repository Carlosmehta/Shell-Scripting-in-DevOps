#!/bin/bash

# How to store the key values pair 


declare -A myArray

myArray=( 
	[name]="Bhaskar"
	[age]="24"
	[city]="India" 
)
i
echo -e "\nName: ${myArray[name]} \nAge: ${myArray[age]} \nCity: ${myArray[city]}"


<<comment

echo "Name: ${myArray[name]}" 
echo "Age: ${myArray[age]}" 
echo "city: ${myArray[city]}"

comment

