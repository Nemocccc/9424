### day1
### write a script to ergodic *.txt files in folder data
### prepare a backup copy for them
### add a suffix for these files, such as copy test.txt as test.txt_20240818

# -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

#!/bin/bash
#author: nemo
#version: v1
#date: 2024-08-18

## define suffix, ``
suffix=$(date+%Y%m%d)

for f in $(find ./data -type f -name "*.txt")
do 
    echo "backup copying"
    cp ${f} ${f}_${suffix}

    # Check if the backup file already exists
    backup_file="${f}_${suffix}"
    if [ -e "$backup_file" ]; then
        echo "Backup file $backup_file already exists."
    else
        echo "Backing up $f to $backup_file"
        cp "$f" "$backup_file"
    fi
done


##### $() : Used for command substitution, that is, to assign the output of a command to a variable