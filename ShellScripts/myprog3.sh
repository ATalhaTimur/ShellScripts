# max depth for file 1 so dont go subdirectories. find all txt files find writable files and create writable directory get all writable txt files and move them to writable directory.
file= find -maxdepth 1 -type f -name "*.txt" -writable
SUB="txt"
writablebefore=`ls $PWD/writable | wc -l`
if [ -w $file ]
then
	
	mkdir -p $PWD/writable
	find $PWD -maxdepth 1  -name '*.txt' -writable -exec mv -t ./writable {} +
	writableafter=`ls $PWD/writable | wc -l`
	echo "$(expr $writableafter - $writablebefore) files moved to writable directory."
else
	:
fi
if [[ "$file" == *"$SUB"* ]]; then
  echo "It's there."
fi
	
