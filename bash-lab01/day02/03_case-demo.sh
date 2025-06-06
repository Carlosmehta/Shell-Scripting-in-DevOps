#!/bin/bash

echo "Provide a OPTION"
echo "a for date"
echo "b for list of script's"
echo "c to check the current locaton"

read choice

case $choice in
	a)date;;
	b)ls -l;;
	c)pwd;;
	*)echo "PLEASE PROVIDE A VALID INPUL !!!"
esac

