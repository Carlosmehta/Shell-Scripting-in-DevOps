#!/bin/bash


read -p "Enter your marks:" marks


if [[$marks -gt 50 ]]
then
	echo "You are PASS"

else 
	echo "You are FAIL"
