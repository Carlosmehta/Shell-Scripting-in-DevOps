#!/bin/bash

read -p "what number did bhaskar get when dice is rolled: " LUCKY 
read -p "dice is not properly rolled %:" rolled

if [[ $LUCKY == "six" ]];

then

	echo "bhaskar is LUCKY"

elif
	[[ $rolled -ge 7 ]];
	
then
	echo "bhaskar is LUCKY"

else

	echo "bhaskar is not LUCKY"

fi



