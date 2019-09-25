#!/bin/bash

word="$1"

echo -n '/'
for (( i=0; i<${#word}; i++ ))
do
	if [[ "${word:$i:1}" == " " ]]
	then
		echo -n '.'
		continue
	elif [[ "${word:$i:1}" == '\' ]] && [[ "${word:(($i+1)):1}" == '\' ]]
	then
		echo -n '[\]'
		i=$((i+1))
		continue
	elif [[ "${word:$i:1}" == '\' ]] && [[ "${word:(($i+1)):1}" =~ [^\\] ]]
	then
		echo -n "${word:$i:1}"
		i=$((i+1))
		echo -n "${word:$i:1}"
		continue
	elif [[ "${word:$i:1}" =~ [^a-zA-Z\d\\:] ]]
	then
		echo -n '['"${word:$i:1}"']'
		continue
	fi
	lower=$(echo ${word:$i:1} | tr A-Z a-z)
	capital=$(echo ${word:$i:1} | tr a-z A-Z)
	echo -n '['"$capital$lower"']'
done

echo -n '/'
echo
