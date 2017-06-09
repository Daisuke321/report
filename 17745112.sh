#!/bin/bash


echo "hi,input two natural numbers"

num1=$1
num2=$2

expr $1 + $2 > /dev/null 2>&1 
if [ $? -ge 2 ] 
then
    echo "bad request" 1>&2
    exit 1
elif [ $1 -le 0 ]||[ $2 -le 0 ]
then
    echo "not natural numbers"
    exit 1
fi

while [ `expr $1 % $2` -ne 0 ]
do
    r=`expr $2 % $1`
    set $r $1

done

echo "the GCD is :" $2

exit 0
