#!/bin/bash

# to access the arguments


echo "first argument is $1"

echo "second argument is $2"

echo "All the arguments are - $@"

echo "number of arguments are - $#"

# for loop to access the values from arguments


for filename in $@

do 
	echo "copying file - $filename"

done

# you can use this script to backup bunch of file's to backup or copy easily
