# get filename, get directory name. if find file delete it , if directory is null or dont entered dont go subdirectory else go subdirectory and find filename .txt files and delete them. ask for before delete them.
filename=$1
directory=$2
files=`find -iname "$filename*.txt" -type f`
files_in_directory=`find -iwholename "$directory/$filename*.txt" -type f`
if ! [ -z $files ]
then
	echo "Do you want to delete $files"
	read choice
else
	exit
fi
if [ $choice == "y" ]
then
	find $PWD -iname "$filename*.txt" -type f -delete
else
	exit
fi
if ! [ -z $directory ]
then
	if ! [ -z $files ]
	then
		echo "Do you want to delete $files"
		read choice
	else
		exit
	fi
	if [ choice == "y" ]
	then
		find $PWD/$directory not -iname "$filename*.txt" -type f -delete
	else
		exit
	fi
fi
