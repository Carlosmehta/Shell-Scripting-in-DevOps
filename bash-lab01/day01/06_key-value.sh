#!/bin/bash

# How to store the key values pair 

# First try's

<<comment

declare -A myArray

myArray=( 
	[name]="Bhaskar"
	[age]="24"
	[city]="India" 
)

echo -e " \nName: ${myArray[name]} \nAge: ${myArray[age]} \nCity: ${myArray[city]} "

comment

# Second Try's


declare -A myArray

myArray=([name]="Bhaskar"[age]="24"[city]="India" )

echo "Name: ${myArray[name]}" 
echo "Age: ${myArray[age]}" 
echo "city: ${myArray[city]}"



