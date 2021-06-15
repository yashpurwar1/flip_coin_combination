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

echo "***************Doublet Combination******************"

declare -A doublet_combination=(
					[HH]=0
					[HT]=0
					[TT]=0
					[TH]=0
				)

for (( flip=1; flip<=num; flip++ ))
do
	toss_1=$((RANDOM%2))
	toss_2=$((RANDOM%2))

	case $toss_1$toss_2 in

	00)
		echo "Heads Heads"
		(( doublet_combination[HH]++ ))
			;;

	01)
		 echo "Heads Tails"
                (( doublet_combination[HT]++ ))
                        ;;
	11)
                 echo "Tails Tails"
                (( doublet_combination[TT]++ ))
                        ;;
	10)
                 echo "Tails Heads"
                (( doublet_combination[TH]++ ))
                        ;;
esac
done
echo ${doublet_combination[@]}

for key in ${!doublet_combination[@]}
do
	percentage=$((${doublet_combination[$key]}*100/$num))
	doublet_combination[$key]=$percentage
	echo "Percentage of $key is ${doublet_combination[$key]}"
done
