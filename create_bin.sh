#!/bin/bash
# Check if the .bashrc file exist
if ! [ -f ~/.bashrc ]; then
				touch ~/.profile
				echo "# Alias definitions." >> ~/.profile
				echo "# You may want to put all your additions into a separate file like" >> ~/.profile
				echo "# ~/.bash_aliases, instead of adding them here directly." >> ~/.profile
				echo "if [ -f ~/.bash_aliases ]; then" >> ~/.profile
				echo "	. ~/.bash_aliases" >> ~/.profile
				echo "fi" >> ~/.profile
fi

# Check if the.bash_aliases file exist
if ! [ -f ~/.bash_aliases ]; then
				touch ~/.bash_aliases
fi
aliaseSymbols="__aliaseSymbols"

command="alias bin='bash ~/.$aliaseSymbols/alias_Recycle_bin.sh'"

if [ -z "$( grep -o "$command" ~/.bash_aliases )" ]; then
				echo "$command" >> ~/.bash_aliases
fi

# Creates the file that contains the script and manuals for the recycleBin
if ! [ -d ~/.$aliaseSymbols ]; then
				mkdir ~/.$aliaseSymbols
fi

# Copy the file to create or update the script
cat alias_Recycle_bin.sh > ~/.$aliaseSymbols/alias_Recycle_bin.sh
cat man_Recycle_bin.sh > ~/.$aliaseSymbols/man_Recycle_bin.sh

# makes all the .sh file an executable
all_sh_files=$(find ~/.$aliaseSymbols/ -name "*.sh" | xargs echo)

cat $all_sh_files

for sh in $all_sh_files; do 
				chmod 755 $sh
done

# Runs the ~./bashrc file to update all canges imediatly 
source ~/.bashrc

echo " Script complete you can now delete the folder"
