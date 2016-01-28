#!/bin/bash
# This script will call the use count URL and collect data.
# after that - it will replace the 3rd , 4th and the 5th arguments ( i.e the git, slack, mural count )
# with what we got by running the below URL .

OUTPUTFILE=githubmembers.xml

wget -v -O ${OUTPUTFILE}  "https://bluepages.ibm.com/tools/groups/groupsxml.wss?task=listMembers&group=ww-github"

if [ -f ${OUTPUTFILE} ]
then
	usercount=`cat $OUTPUTFILE |grep member |wc -l`
	echo $usercount
fi

OUTPUTFILE=muralmembers.xml

wget -v -O ${OUTPUTFILE}  "https://bluepages.ibm.com/tools/groups/groupsxml.wss?task=listMembers&group=ww-murally"

if [ -f ${OUTPUTFILE} ]
then
	muralusercount=`cat $OUTPUTFILE |grep member |wc -l`
	echo $muralusercount
fi
OUTPUTFILE=slackmembers.xml

wget -v -O ${OUTPUTFILE}  "https://bluepages.ibm.com/tools/groups/groupsxml.wss?task=listMembers&group=ww-slack"

if [ -f ${OUTPUTFILE} ]
then
	slackusercount=`cat $OUTPUTFILE |grep member |wc -l`
	echo $slackusercount
fi

echo "usercount      = $usercount"
echo "muralusercount = $muralusercount"
echo "slackusercount = $slackusercount"

cat usercount.txt |awk '{print $1, $2, $3, $4, $5,$6}'
export USERHOME=/home/abhay

cat usercount.txt  |awk 'BEGIN {a='$usercount'; b='$muralusercount'; c='$slackusercount'} END {print $1,$2, a,"," ,b,",", c,",", $6}' >${USERHOME}/newusercount.txt
mv ${USERHOME}/newusercount.txt ${USERHOME}/usercount.txt

# https://bluepages.ibm.com/tools/groups/groupsxml.wss?task=listMembers&group=ww-murally"
# https://bluepages.ibm.com/tools/groups/groupsxml.wss?task=listMembers&group=ww-slack"
