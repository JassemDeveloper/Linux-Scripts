#!/bin/bash

#return data from database
`sqlplus -s  hr/yourpassword<<EOF>file.txt 
set newpage none
set head off
set pagesize 5000
set feedback off
select first_name,last_name,salary from employees;
quit`

# Create First part of html  page
cat >index.html <<EOF
<!DOCTYPE html>
<html>
<head>
<title> Script Name </title>
<style>
.centre{
width:900px;
margin:0 auto;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
    border:1px solid black;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}

</style>
</head>
<body>
<div class="centre">
<table>
<tr>
<th> First Name </th>
<th> Last Name </th>
<th> Salary </th>
</tr>
EOF

#read data from file and add it to  table in index.html 
while read file
do

cat >> index.html << EOF
<tr>
<td>
$(echo $file |awk '{print $1}')
</td>
<td>
$(echo $file |awk '{print $2}')
</td>
<td>
$(echo $file |awk '{print $3}')
</td>
</tr>
EOF

done <file.txt

#last part of html page
cat >>index.html <<EOF
</table>
</div>
</body>
</html>
EOF

#run report in firefox browser
firefox index.html
