#!/bin/bash

# ARRAY 

myARRAY=( 1 20 40.5 hello "Hey buddy!")

echo "All the values in the array are ${myARRAY[*]}"

: << comment

 Using * will let you print all elements of the array.
To print a single element, use the index like ${myARRAY[element_number]}.

comment

echo "${myARRAY[2]} ${myARRAY[4]}"


