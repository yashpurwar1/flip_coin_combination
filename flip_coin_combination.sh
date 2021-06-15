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

echo ${triplet_combination[@]}


# To extract keys and values

singlet_combinations=${!singlet_combination[@]}
singlet_percentage=${singlet_combination[@]}

doublet_combinations=${!doublet_combination[@]}
doublet_percentage=${doublet_combination[@]}

triplet_combinations=${!triplet_combination[@]}
triplet_percentage=${triplet_combination[@]}

# To store all the combination and percentage to another array
total_combination+=( ${singlet_combinations[@]} ${doublet_combinations[@]} ${triplet_combinations[@]} )
total_percentage+=( ${singlet_percentage[@]} ${doublet_percentage[@]} ${triplet_percentage[@]} )




echo "*********** Sorting the percentages of each combination********** "




echo  "sorted singlet combination percentages:"
ans1=$(printf "%s\n" "${singlet_percentage[@]}" | sort -n)
echo $ans1

echo  "sorted doublet combination percentages:"
ans2=$(printf '%s\n' "$doublet_percentage" | sort -n)
echo $ans2

echo  "sorted triplet combination percentages:"
ans3=$(printf "%s\n" "${triplet_percentage[@]}" | sort -n)
echo $ans3


echo "************************WINNERS***********************"

echo "For Singlet Combination"
echo $singlet_combinations $singlet_percentage

echo "For Doublet Combination"
echo $doublet_combinations $doublet_percentage

echo "For Triplet Combination"
echo $triplet_combinations $triplet_percentage

echo "For All Combinations"
echo $total_combinations $total_percentage
