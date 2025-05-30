#!/bin/bash

myVar="Hey buddy, How are you !"

myVarlength=${#myVar}


echo "length of the myVar is: $myVarlength"


# Now, Using the UPPERCASE, LOWERCASE command to replace a string.


echo "Uppercase:---------- ${myVar^^}"

echo "Lowercase:---------- ${myVar,,}"

# Now, Using a REPLACE command.


newVar=${myVar/buddy/Bhaskar}

echo "NEW VAR is:-- $newVar"


# Now, Using the SLICE command to slice a string.


echo "After Slice: ${myVar:4:5}"


<<comment

4:5 cause 4 is the "buddy" word and it has 5 letter's  that's why it print "BUDDY"
and if you write 4:1 then it will print "b" only/---------

comment


