#!/bin/bash

# ARRAY 

myARRAY=( 1 20 40.5 hello "Hey buddy!" bye) 

echo "All the values in the array are: ${myARRAY[*]}"

: << comment

 Using * will let you print all elements of the array.
To print a single element, use the index like ${myARRAY[element_number]}.

comment

echo "${myARRAY[2]} ${myARRAY[4]}"

# How to find no. of value in an array

echo "no of values, length of an array is: ${#myARRAY[*]}"

echo "Values from index 2-3: ${myARRAY[*]:2:2}"

# Updating our array with new values  

myArray+=( NEW 40 60 )

echo "Values of new array are: ${myArray[*]}"

