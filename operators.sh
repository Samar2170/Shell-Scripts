#!bin/sh

val=`expr 2 + 2`  
#space necessary
echo "Total value : $val"

a=12
b=14
c=14

if [ $a -eq $b ]
then 
   echo "$a -eq $b : a is equal to b"
else
   echo "$a -eq $b: a is not equal to b"  
fi

if [ $a -ne $b ]
then
   echo "$a -ne $b: a is not equal to b"
else
   echo "$a -ne $b : a is equal to b"
fi

if [ $a != $b ]
then
   echo "$a != $b : a is not equal to b"
else
   echo "$a != $b: a is equal to b"
fi
