#!/bin/bash

# Use bash conditions and loops to create 
# interactive scripts that prompt the user 
# for input and perform different actions 
# based on user responses.



current_user=$(whoami)

while true; do
    echo "Welcome $current_user!, how are you feeling today?"
    echo "Please select one of the choices below:"
    echo "1. I am feeling great! 🕺💃"
    echo "2. I am in the mood to watch a film today! 🎥"

    printf "\n"

    echo "========================================"

    printf "\n"

    read choice

    case $choice in
        1)
            echo "What would you like to learn today?"
            read learning_material

            sudo apt-get install html2text
            learning_material_file=$(curl https://en.wikipedia.org/wiki/${learning_material} | html2text --width 0 > ${learning_material.txt})
            
            nano $learning_material_file
            ;;

        2)
            echo "What film would you like to watch?"
            read filmname

            echo "In which directory is the film stored?"
            read film_dir

            film_path=$(locate $film_dir | grep "mp4")
            
            mplayer -vo caca $film_path/$filmname
            ;;
    esac
done
