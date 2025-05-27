#!/bin/bash

read -p "What number did Bhaskar get when dice is rolled: " LUCKY
read -p "Dice is not properly rolled (%): " rolled

# Convert input to lowercase to avoid case mismatches
LUCKY=$(echo "$LUCKY" | tr '[:upper:]' '[:lower:]')

# Check if LUCKY is "six"
if [[ "$LUCKY" == "six" ]]; then
    echo "Bhaskar is LUCKY"

# Else check if rolled is a number and >= 7
elif [[ "$rolled" =~ ^[0-9]+$ ]] && [[ "$rolled" -ge 7 ]]; then
    echo "Bhaskar is LUCKY"

else
    echo "Bhaskar is not LUCKY"
fi




