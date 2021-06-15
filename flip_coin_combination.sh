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
	#update count values  with corresponding percentage
	percentage=$((${singlet_combination[$key]} *100 / $num))
	singlet_combination[$key]=$percentage
	echo "Percentage of $key is ${singlet_combination[$key]%}"
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

for key in ${!doublet_combination[@]}
do
	#update count values  with corresponding percentage
	percentage=$((${doublet_combination[$key]}*100/$num))
	doublet_combination[$key]=$percentage
	echo "Percentage of $key is ${doublet_combination[$key]%}"
done



echo "******************Triplet Combination*******************"
declare -A triplet_combination=(
                                    [HHH]=0
                                    [HHT]=0
                                    [HTH]=0
                                    [HTT]=0
                                    [THH]=0
                                    [THT]=0
                                    [TTH]=0
                                    [TTT]=0
                                )

for(( flip = 1; flip <= num; flip++ ))
do
    ((toss_1=RANDOM%2))
    ((toss_2=RANDOM%2))
    ((toss_3=RANDOM%2))

    #0 is mapped as heads
    #1 is mappes as tails
    case $toss_1$toss_2$toss_3 in

        000)
            	echo "Heads Heads Heads"
            	(( triplet_combination[HHH]++ )) 
            		;;
        001)
            	echo "Heads Heads Tails"
            	(( triplet_combination[HHT]++ ))
            		;;
        010)
            	echo "Heads Tails Heads"
            	(( triplet_combination[HTH]++ ))
            		;;
        011)
            	echo "Heads Tails Tails"
            	(( triplet_combination[HTT]++ ))
            		;;
        100)
            	echo "Tails Heads Heads"
            	(( triplet_combination[THH]++ )) 
            		;;
        101)
            	echo "Tails Heads Tails"
            	(( triplet_combination[THT]++ ))
            		;;
        110)
            	echo "Tails Tails Heads"
            	(( triplet_combination[TTH]++ ))
            		;;
        111)
           	echo "Tails Tails Tails"
            	(( triplet_combination[TTT]++ ))
            		;;
    esac
done
for key in ${!triplet_combination[@]}
do
	#update count values  with corresponding percentage
        percentage=$(( ${triplet_combination[$key]}*100/$num ))
    	triplet_combination[$key]=$percentage
    	echo "percentage of $key is ${triplet_combination[$key]}%"
done
