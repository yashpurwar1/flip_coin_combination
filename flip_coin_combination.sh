#!/bin/bash -x
echo "Welcome to flip coin combination problem"

toss=$((RANDOM%2))

if [ $toss -eq 0 ]
then
	echo "Heads"
else
	echo "Tails"
fi
