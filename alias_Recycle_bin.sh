#!/bin/bash
aliasName="bin" # User defined alias
bin_name=__RECYCLE_BIN
bin_path=~/$bin_name

if [ -z "$1" ]; then
	echo "Use -h to get help"
	exit 1

elif [ $1 == '-h' ]; then 
	~/.aliaseSymbols/man_Recycle_bin.sh $aliasName
	exit 0

elif [ $1 == '--help' ]; then	
	printf " %.0s" $(seq 1 15); echo ' <<'$aliasName'_help>> '; 
	~/.aliaseSymbols/man_Recycle_bin.sh $aliasName

	printf " %.0s" $(seq 1 15); echo ' <<Move_help>> '; 
 	mv --help
	exit 0

fi

function __filePreprocessing {
	fileName=$1
	bin_path=$2
	# Removes '/'eg:{one/} if present
	files=$(echo $fileName | sed 's/\/$//')

	# Check if a duplicate fileName already exist in the bin
	if [ -e "$bin_path/$files" ]; then
		formatted_date=$(date +"%Y-%m-%d_%H:%M:%S")
		renamedFile="$files-$formatted_date"
		mv $files $renamedFile
		echo $renamedFile
	else
		echo $files
	fi
}


# Checks if file doesnt exist
if ! [ -d $bin_path ]; then
	mkdir $bin_path
fi

# Checks if user wants to empty the recycle bin
if [ $1 == -e ]; then 
		rm -r $bin_path
		mkdir $bin_path

else # Moves files specified into the recycle bin
	for files in "$@" 
	do
			files=$(__filePreprocessing $files $bin_path)
			mv $files $bin_path
	done
fi

