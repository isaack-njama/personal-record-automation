#!/bin/bash

# Design an interactive menu system using Bash scripting, 
# allowing users to add a new record, edit existing records, 
# search for specific records, and generating reports.

current_user=$(whoami)

while true; do
    echo "Welcome!"
    echo "Please select one of the choices below:"
    echo "1. Create a new directory 📁"
    echo "2. Create a new file "
    echo "3. Edit directory name"
    echo "4. Edit file name"
    echo "5. Search for a directory 🔎"
    echo "6. Search for a file"
    echo "7. Generate a report"

    printf "\n"

    echo "========================================"

    printf "\n"

    read choice

    case $choice in
        1)
            echo "Please enter the name of your new directory:"
            read dirname

            mkdir $dirname

            # if [ $dirname ]
            # then
            echo "
                The directory $dirname has been successfully created!
                Navigate to ./$dirname to access
                the contents of the directory!
            "
            # else
            #     echo "
            #         Sorry $current_user, the directory
            #         you specified cannot be created at 
            #         the moment.
            #     "
            # fi
            ;;

        2)
            echo "Please enter the name of your new file:"
            read filename

            touch $filename

            echo "
                The file $filename has been successfully created!
                Feel free to open the file in your favorite text 
                editor!
            "
            ;;

        3)
            echo "Please indicate the directory you wish to modify:"
            read dirname

            echo "Please indicate the name you wish to rename your directory to:"
            read newdirname

            mv $dirname $newdirname

            echo "
                The directory $dirname has been successfully
                renamed to $newdirname. Navigate to ./$newdirname
                to access the contents of the directory!
            "
            ;;

        4)
            echo "Please indicate the file you wish to modify:"
            read filename

            echo "Please indicate the name you wish to rename your file to:"
            read newfilename

            mv $filename $newfilename

            echo "
                The file $filename has been successfully
                renamed to $newfilename. Feel free to play
                around with the file in your favorite text 
                editor!
            "
            ;;

        5)
            echo "Please indicate the directory you wish to find:"
            read dirname

            # echo "Do you wish to perform a global or local search?"
            # read search_choice

            # case $search_choice in
            #     1)
            #         echo "Global Search"
            #         alias global_dir_paths = $(locate / $dirname >> personal-record.txt)

            #         echo "The directory $dirname is found in the following
            #             locations: $global_dir_paths"
            #         ;;

            #     2)
            #         echo "Local Search"
            #         alias local_dir_path = $(locate . $dirname >> personal-record.txt)

            #         echo "The directory $dirname is found in the following
            #             location: $local_dir_path"
            #         ;;

            # Search the entire system to find directory, ignoring case
            dir_path = $(find . -type d -name $dirname 2> /dev/null >> personal-record.txt)
            path_dir = $(locate . $dirname >> personal-record.txt)

            echo "Searching..."
            echo "Search completed!"

            echo "
                The directory $dirname is located 
                in the path $dir_path
            "
            ;;
            # esac

        6)
            echo "Please indicate the file you wish to find:"
            read filename

            file_path = $(find . -type f -name $filename 2> /dev/null >> personal-record.txt)
            echo $file_path

            # echo "Searching..."
            # echo "Search completed!"
            echo "
                The directory $filename is located 
                in the path $file_path
            "
            ;;

        7)
            printf "\tSystem report for user $(whoami) on $(hostname):\n" >> report.txt
            printf "\tGenerated on: \t%s\n" $(date +"%m/%d/%y") >> report.txt
            printf "\tFiles in directory: \t%s\n" $(ls | wc -l) >> report.txt
            printf
    esac
done
