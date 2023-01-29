string=$1 # get string
encryptno=$2 # get number

str_len=${#string} # string length
encrypted=${#encryptno} # number length

alp="abcdefghijklmnopqrstuvwxyz" # alphabet string

alp_len=${#alp} # alphabet length
for((i=0;i<str_len;i++)) # for loop for string length
do
for((j=0;j<alp_len;j++)) # for loop for alphabet length
do
	if [ ${alp:$j:1} == ${string:$i:1} ] # if alphabet any char matches with string char.
	then
		if [ $encrypted == 1 ] # if number length equal 1
		then
			if [ "${alp:$(expr $j + $encryptno):1}" == "" ] # alphabet string overflow then start from beginning + number = new strring
			then
				echo "${alp:$encryptno-1:1}" # alphabet str + number
			else
				echo "${alp:$(expr $j + $encryptno):1}" # alphabet string + number
			fi
		else
			if [ "${alp:$(expr $j + ${encryptno:$i:1}):1}" == "" ] # overflow, start from beginning.
			then
				echo "${alp:$(expr -1 + ${encryptno:$i:1}):1}" # number len > 1. for every number encrypt.
			else
				echo "${alp:$(expr $j + ${encryptno:$i:1}):1}"
			fi
		fi
	fi
done
done

