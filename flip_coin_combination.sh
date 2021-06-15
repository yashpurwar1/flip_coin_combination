#!/bin/bash -x
echo "Welcome to flip coin combination problem"

read -p "Enter number of times to toss the coin: " num

declare -A singlet_combination=(
					[H]=0
					[T]=0
				)
# Singlet Combination

for (( flip=1; flip<=num; flip++ ))
do

	toss=$((RANDOM%2))

	case $toss in

	0)
		echo "Heads"
		(( singlet_combination[H]++ ))
			;;

	1)
		echo "Tails"
		(( singlet_combination[T]++ ))
			;;
esac
done

for key in ${!singlet_combination[@]}
do
	percentage=$((${singlet_combination[$key]} *100 / $num))
	singlet_combination[$key]=$percentage
	echo "Percentage of $key is ${singlet_combination[$key]}"
done
