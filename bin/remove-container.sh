#!/bin/bash -e
templates=(templates/*)
basenames=()
for file in "${templates[@]}"
do
     filename=${file##*/}
     basenames+=(${filename%.*})
done

PS3="Choisissez le container à supprimer : "

select template in "${basenames[@]}" "Cancel" ; do 
    case $template in
        "Annuler")
            echo "A bientôt."
            break
            ;;
        *)            
        TEMPLATE="templates/$template/install.sh"
        if [ -f $TEMPLATE ];
        then
            source $TEMPLATE
            unInstall
        else
            echo "pas de script d'installation trouvé"
        fi
        break
        ;;
    esac
done
