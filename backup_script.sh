#!/bin/bash


echo "##############################################"
#
echo "Backup /home to /backups and restore script."
#
echo "##############################################"

# What to backup. 
backup_files="/home"

# Where to backup to.
dest="/backups"

# Create archive filename.
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"


PS3='Please enter your choice: '
options=("Option 1" "Option 2" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "you chose to backup"
# Print start status message.
        echo "Backing up $backup_files to $dest/$archive_file"
        date
        echo

# Backup the files using tar.
        tar czf $dest/$archive_file $backup_files

# Print end status message.
        echo
        echo "Backup finished"
        date

# Long listing of files in $dest to check file sizes.
        ls -lh $dest
            ;;

        "Option 2")
            echo "you chose to restore"
                tar -xvf /backups/"$archive_file" -C /restore
            ;;

        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

