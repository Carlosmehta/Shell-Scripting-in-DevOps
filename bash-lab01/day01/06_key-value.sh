#!/bin/bash

# How to store the key-value pair 

# First Trail

<<comment

declare -A myArray

myArray=( 
	[name]="Bhaskar"
	[age]="24"
	[city]="India" 
)

echo -e " \nName: ${myArray[name]} \nAge: ${myArray[age]} \nCity: ${myArray[city]} "

comment

# Second Trail


declare -A myArray

myArray=([name]="Bhaskar"[age]="24"[city]="India" )

echo "Name: ${myArray[name]}" 
echo "Age: ${myArray[age]}" 
echo "city: ${myArray[city]}"



