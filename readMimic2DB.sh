#!/bin/bash

#count=0
#while read -r line
#do
	#for word in $line;
	#do 
		#array[$count]=$word
		#count=$(($count + 1))
	#done
#done <testRead.txt

#count2=0
while read p
do
	sudo get_hrv -L mimic2db/a$p/a$p  qrs >>mtest.txt
done <cleanRecords
