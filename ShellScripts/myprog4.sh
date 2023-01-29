# get number, define all hex values. #first find all prime numbers between 2 to number. get every prime between range and uses prime numbers to get their hex values.
number=$1
hex_values="0123456789ABCDEF"

#!/bin/bash
hex_value=""
prime_1=0
n=$1
echo " Prime number between 1 to $n is:"
for((i=2;i<=n;))
do
sayi2=$i
  for((j=i-1;j>=2;))
  do
    if [  `expr $i % $j` -ne 0 ] ; then
      prime_1=1
    else
      prime_1=0
      break
    fi
    j=`expr $j - 1`
  done
  if [ $prime_1 -eq 1 ] ; then
  	
  
	until [ $sayi2 == 0 ]
	do
	kalan=$(expr $sayi2 % 16)
	sayi2=$(expr $sayi2 / 16)
	hexadecimalno=${hex_values:$kalan:1}
	fullvalue="${hexadecimalno}${fullvalue}"
	done
	echo "Hexadecimal of $i is ${fullvalue}"
	fullvalue=""
  fi
  i=`expr $i + 1`
done
