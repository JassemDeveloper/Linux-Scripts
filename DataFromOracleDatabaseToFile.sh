#!/bin/bash

#return data from database
`sqlplus -s  hr/yourpassword<<EOF>file.txt 
set head off
set pagesize 5000
set feedback off
select first_name,last_name,salary from employees;
quit`

#read data from file and print it on the screen
#$1 means the first value in the line 
#$2 the second value in the same line etc 

while read file
do

echo $file | awk '{print "name: ( First: " ,$1,")(Last: ",$2,"),Salary: " ,$3}' 

done<file.txt