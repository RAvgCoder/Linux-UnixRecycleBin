#!/bin/bash

# Global* variables
aliasName="bin" # User defined alias
bin_name=__RECYCLE_BIN
bin_path=~/$bin_name
aliaseSymbols="__aliaseSymbols"

# Checks flags if they are valid for the alias 
function __flag_checking()
{
	if [ -z "$1" ]; then
		echo "Use -h to get help"
		exit 1

	# Shows content of bin
	elif [ $1 == '-s' ]; then
		ls -la ~/__RECYCLE_BIN
		exit 0
	
	# Empties the recycle bin
	elif [ $1 == '-c' ]; then 
		rm -r $bin_path
		mkdir $bin_path
		echo "Bin emptied"
		exit 0

	# Empties the recycle bin
	elif [ $1 == '-cF' ]; then 
		rm -rf $bin_path
		mkdir $bin_path
		echo "Bin emptied with force"
		exit 0

	# User asks for help for the alias	
	elif [ $1 == '-h' ]; then 
		~/.$aliaseSymbols/man_Recycle_bin.sh $aliasName
		exit 0

	# User asks for help for the alias along with mv alias	
	elif [ $1 == '--help' ]; then	
		# {" %.0s" $(seq 1 15);} prints a space 15 times
		printf " %.0s" $(seq 1 15); echo ' <<'$aliasName'_help>> '; 
		~/.$aliaseSymbols/man_Recycle_bin.sh $aliasName
		printf " %.0s" $(seq 1 15); echo ' <<Move_help>> '; 
 		mv --help
		exit 0

	fi
}

# Prepares each file for deletion
function __filePreprocessing() 
{
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

# Starts the script
function main()	
{
	# Checks if file doesnt exist
	if ! [ -d $bin_path ]; then
		mkdir $bin_path
	fi	
	
	__flag_checking "$@"
	
	# if no flags used  the user wants to delete files
	if [ -z "$( __flag_checking "$@" )"	]; then
		for files in "$@"; do
			files=$(__filePreprocessing $files $bin_path)
			mv $files $bin_path
		done
	fi
}

# Begining of the program
main "$@"
