#!/bin/bash

##################################################################
#                                                                #
# Script to upload from REHL to Sharepoint Document Library      #
#                                                                #
##################################################################
#Active Driectory Domain
domain=YourDomain
#File which to be uploaded to sharepoint 
fileName=$1
#Your Active Driectory Username and has premsision to upload file to sharepoint document library
userName=$2
password=$3
auth=$(echo $domain\\$userName:$password)
#URL for document library and $fileName is the file name which will be used when uploaded to document library
path=http://10.10.10.10/sites/root/Shared%20Documents/$fileName

#Usage
#[root@oraclesrv ~]# ./uploadFromREHLToSharepoint.sh fileToBeUpload username 'Password'

curl -v  --ntlm -u "$auth" -T "$fileName" "$path"
