# cut giris,gelisme,sonuc line by line. get filename. if file name existed overwrite question if dont exist create. get random index number for giris gelisme sonuc array. get new story.
readarray -t giris < <(cut -d, -f1 giris.txt)
filename=$1

if [ -z $filename ]
then
	girisrandom=$((0 + SRANDOM % 5))
	if [ $(expr $girisrandom % 2) == 0 ]
	then
		:
	else
		girisrandom=2
	fi

	echo ${giris[girisrandom]} >> $filename


	readarray -t gelisme < <(cut -d, -f1 gelisme.txt)
	gelismerandom=$((0 + SRANDOM % 5))
	if [ $(expr $gelismerandom % 2) == 0 ]
	then
		:
	else
		gelismerandom=2
	fi

	echo ${gelisme[gelismerandom]} >> $filename

	readarray -t sonuc < <(cut -d, -f1 sonuc.txt)
	sonucrandom=$((0 + SRANDOM % 5))
	if [ $(expr $sonucrandom % 2) == 0 ]
	then
		:
	else
		sonucrandom=2
	fi

	echo ${sonuc[sonucrandom]} >> $filename
else
	echo "$filename exists. Do you want it to be modified? (y/n): "
	> $filename
	read choice
	if [ $choice == "y" ]
	then
		girisrandom=$((0 + SRANDOM % 5))
			if [ $(expr $girisrandom % 2) == 0 ]
			then
				:
			else
				girisrandom=2
			fi

			echo ${giris[girisrandom]} >> $filename


			readarray -t gelisme < <(cut -d, -f1 gelisme.txt)
			gelismerandom=$((0 + SRANDOM % 5))
			if [ $(expr $gelismerandom % 2) == 0 ]
			then
				:
			else
				gelismerandom=2
			fi

			echo ${gelisme[gelismerandom]} >> $filename

			readarray -t sonuc < <(cut -d, -f1 sonuc.txt)
			sonucrandom=$((0 + SRANDOM % 5))
			if [ $(expr $sonucrandom % 2) == 0 ]
			then
				:
			else
				sonucrandom=2
			fi

			echo ${sonuc[sonucrandom]} >> $filename
	else
		exit
	fi	
fi
