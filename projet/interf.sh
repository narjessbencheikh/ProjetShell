TITBOX=menu
image=/home/sliti/projet/j.png

f1()
{

sudo lshw	

}
f2(){

sudo lscpu

}


helps()
{
yad --info --text="application ./shell.sh permet d afficher les caractéristiques hardware de votre machine  via les commandes lshw et lscpu:
Voici les options  :
option : -lw
option : -lu
option : -h ou -help
option : -s ou --save
 
  Fin help"

}

save() { 
echo "- $(lshw -sanitize)" >> save.txt
   lshw >> save.txt
   lscpu >> save.txt
   cat save.txt
}

menu()
{
yad --title=$TITBOX --text="veuillez entrer votre choix" \
    --window-icon="$icone" --image="$image" --image-on-top \
    --list --radiolist --no-headers \
    --button=gtk-no:1 --button=gtk-yes:0 \
    --column 1 --column 2  --print-column=2 \
	false "lw" true "lu"\
	false "h" false "s"
}

program()
{
while true
do 
CHOIX=`menu`
case $? in
252|1) 
exit 0
;;
0)
	case $CHOIX in 
	"lw|")
f1

;;
	"lu|")

f2
;;
	"s|")
save

;;
    "h|")
helps
;;

esac
esac
done

}

program






menu()
{
x=1
while [ $x != 0 ]
do
echo ""
echo "1-Afficher les caractéristiques hardware via -lshw"
echo "2-Afficher les caractéristiques hardware via -lscpu"
echo "3-sauvgarder "
echo "4-Helps"
echo "0-QUittez"
echo ""
echo "Entrer votre choix :"
read x
case $x in
1)
echo "Vous voulez passez des arguments (Oui/Non):"
read reponse
if [ $reponse = Oui ]
then
echo "Entrer vos arguments :"
read argument
f1 $argument
else
f1

fi
;;
2)
echo "Vous voulez passez des arguments (Oui/Non):"
read reponse
if [ $reponse = Oui ]
then
echo "Entrer vos arguments :"
read argument
f2 $argument
else
f2
fi
;;
3)
echo "Vous voulez passez des arguments (Oui/Non):"
read reponse
if [ $reponse = Oui ]
then
echo "Entrer vos arguments :"
read argument
save $argument
else
save
fi
;;
4)helps
;;
esac
export -s f1 f2 save helps
done
}

