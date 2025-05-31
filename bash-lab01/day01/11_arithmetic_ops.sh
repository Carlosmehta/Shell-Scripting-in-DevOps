#!/bin/bash

# Maths Calculation 

x=10
y=2


#first way: 

# Multiplication (must use $(( ... )) for arithmetic)

multi=$((x * y))
echo "Multiplication: $multi"

# Modulus (remainder)

percent=$((x % y))
echo "Modulus: $percent"

# Addition 

add=$((x + y))
echo "Addition: $add"

# Subtraction 

sub=$((x - y))
echo "subtraction: $sub"

#division

divide=$((x / y))
echo "division: $divide"



