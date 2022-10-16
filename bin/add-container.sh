#!/bin/bash -e
templates=(templates/*)
basenames=()
for file in "${templates[@]}"
do
     filename=${file##*/}
     basenames+=(${filename%.*})
done

PS3="Select a container: "

select template in "${basenames[@]}" "Cancel" ; do 
    case $template in
        "Cancel")
            echo "Goodbye."
            break
            ;;
        *)
            cat templates/${template}.yml > public/${template}.yml
            echo "$template added to your stack."
            break
            ;;
    esac
done