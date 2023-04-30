# Gets the recycle alias
recycleAlias=$1

printf "%-10s %-10s %-10s\n" "Usage:" "$recycleAlias" "[FLAGS]"
printf "%-10s %-10s %-10s\n" "Usage:" "$recycleAlias" "DIRECTORY"
echo
printf "%-10s %-10s\n" "Flags" "Meaning"
printf "%-10s %-10s\n" "-h" "Brings up a help menu for only the bin command"
printf "%-10s %-10s\n" "--help" "Brings up a help menu for both the bin and mv command"
printf "%-10s %-10s\n" "-c" "Clears the recycle_bin"
printf "%-10s %-10s\n" "-cF" "Clears the recycle_bin for files that require a force removal"
printf "%-10s %-10s\n" "-s" "Shows the content of the recycle bin"
echo
