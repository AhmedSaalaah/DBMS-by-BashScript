printf "\n choose an option of the following \n "
printf "\n 1-create database 2-select database 3-delete database 4-exit \n"
read var
case $var in
 
1)
printf "\n enter name of database \n" 
read name 
if test -d $name 
then
printf "database already existed \n"
. ./f1.sh
else
 
mkdir $name

cd $name
printf "now you are in database $name \n" 
fi

;;
2)
 
printf "enter name of database\n"
read name
if test -d $name  
then
cd $name
printf "now you are in database $name \n "
else

printf "databese doesnot existi \n"
 . ./f1.sh

fi

;;
3)

printf "enter name of database \n"
read name
if test -d $name
then
rm -r $name
printf "data base deleted successfull \n"
. ./f1.sh
else
printf "database doesnot exist"

. ./f1.sh
fi
;;

4)
cd .. 
;;


esac
