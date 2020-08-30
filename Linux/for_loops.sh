#!/bin/bash

#practicing  de loop de loops

#variables defined
numbas={0..9}

state=(
'oregon'
'florida'
'washington'
'arizona'
'montana'
)

ls_out=$(ls)

#number check
for numbers in $numbas[@]};
do
	if [ $numbas = 3 ] || [ $numbas = 5 ] || [$numbas = 7]
	then
		echo $numbas
	fi

done

#state check
for state in ${state[@]};
do
	if [ $state = 'Hawaii' ];
	then
		echo "Hawaii is the best!"
	else
		echo "I am not fond of Hawaii"
	fi
done

for x in ${ls_out[@]};
do
	echo $x
done

#suid+$(find //type f -perm / 4000 2> /dev/null)

for suid in ${suids[@]};
do
	echo $suid
done
