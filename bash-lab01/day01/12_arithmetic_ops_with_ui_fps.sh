#!/bin/bash

# Arthmetic ops Script with User Input and Floating Point Support.

# Maths Calculation with user input


# Prompt user

read -p "Enter first number: " x
read -p "Enter second number: " y

# Integer operations
multi=$((x * y))
modulus=$((x % y))
add=$((x + y))
subtract=$((x - y))

# Floating point division using 'bc'

division=$(echo "scale=2; $x /$y" | bc)

# Display results

echo "Multiplication: $multi"
echo "Modulus: $modulus"
echo "Addition: $add"
echo "Subtraction: $subtract"
echo "Division: $division"
