#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=7
BACKTITLE="Application Gestion hardware"
TITLE="Menu"
MENU="Enter a choice:"

OPTIONS=(1 "Hardware Information"
         2 "Memory Info"
         3 "Cpu Information "
         4 "Storage Info And Partitions"
         5 "Network Info"
         6 " Bus Info"
         7 "Hide Important Configuration Info "
         8 "Help"
        9 "Save" )

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
              --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
"${OPTIONS[@]}" \
  2>&1 >/dev/tty)
clear
        case $CHOICE in 
       1)     
    echo ">>>>> Hardware Information <<<<<"
    echo "====================================="
    echo "Short Version :- $(lshw -short)"


  
;;
       2)     
    echo ">>>>>    Memory Info.   <<<<<"
    echo "====================================="
    echo "       Memory :- $(lshw -class memory)"

;;
      3) 

    echo ">>>>> Cpu Information  <<<<<"
    echo " "
    echo "Cpu Model :- $(lshw  -class processor)"
    echo " "
    echo "----------------------"
    echo "All Information"
    echo
    echo "- $(lscpu)"
    echo "-----------------------"
    echo "Nodes Info :- $(lscpu -e) "
    echo " "
;;
4)
    echo ">>>>>    Storage Info And Partitions   <<<<<"
    echo "====================================="
    echo "       Disk Info :- $(lshw -short -class disk)"
    echo "-----------------------"
    echo "Partitions And Volumes :- $(lshw -class storage -class volume) "
    echo " "

;;
5)
    echo ">>>>>    Network Info   <<<<<"
    echo "====================================="
    echo "       Network Info :- $(lshw  -class network)"
    echo " "

;;
6)
    echo ">>>>>    Bus Info   <<<<<"
    echo "====================================="
    echo "       Bus Info :- $(lshw -businfo)"
    echo " "

;;
7)
    echo ">>>>>    Hide Important Configuration Info   <<<<<"
    echo "====================================="
    echo "       Info :- $(lshw -sanitize)"
    echo " "

;;
8)
    echo "pogramme pour lancer la commande "lshw" qui permet d'afficher les informations sur les périphériques d'un ordinateur et la commande "lscpu" qui permet d'obtenir de l'information sur l'architechture du processeur"
 
;;
9)
   echo "- $(lshw -sanitize)" >> sauve.txt
   lshw > sauve.txt
   lscpu >> sauve.txt
   cat sauve.txt
   
;;

        esac
  

v


