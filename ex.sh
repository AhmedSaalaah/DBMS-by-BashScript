select choice in Ahmed Adel Tamer
do
case $choice in
Ahmed) printf Ahmed is good boy
;;
Adel) printf Adel is the best
;;
Tamer) printf Tamer is a bad boy
;;
*) printf $REPLY is not one of the choices.
;;
esac
done
