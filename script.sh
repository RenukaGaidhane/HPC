#!/bin/bash
#for ((i=;i<=$#;i++));do 
for i in "${@}";do
        echo "LOOP: ${i}"
done
#arr=(a b c)		#Create an empty array
#echo "\@ : ${arr[@]}"
#echo "\* : ${arr[*]}"
#echo "1 : ${arr[1]}"
#echo "index : ${!arr[@]}"
#echo "Count : ${#arr[@]}"
#arr[0]='z'
#echo "0 : ${arr[0]}"
#arr+=(lol)
#echo "\+= : ${arr[@]}"
#arr2=( $(ls /root/hpcsa/staged/) $(pwd) )
#echo "arr2 : ${arr2[@]}"
#echo "arr2 : ${!arr2[@]}"
#echo "arr2 : ${arr2[7]}"
##
##
##
##arr=(a b c)	#Initialize array
##${arr[2]}	#Retrieve third element
##${arr[@]}	#Retrieve all elements
##${arr[*]}	#Retrieve all elements
##${!arr[@]}	#Retrieve array indices
##${#arr[@]}	#Calculate array size
##arr[0]=lol	#Overwrite 1st element
##arr+=(4 6)	#Append value(s)
##str=$(ls)	#Save ls output as a string
##arr=( $(ls) )	#Save ls output as an array of files
##
