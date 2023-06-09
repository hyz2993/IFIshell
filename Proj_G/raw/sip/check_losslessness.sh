#! /bin/bash

echo -e "This bash script is written by Yazhou He
Usage: This script is to check losslessness
\tfor a batch of sipped image sequence object.
\tIt needs to be copied into the sip folder containing a batch of sips. 
\tIt will check the losslessness from SIP/UUID/logs/UUID_sip_log.log
\tIt will return the result of 'all lossless' or 'lossy exists' at the end
"

local_path=$(dirname $0)
cd $local_path
path=$(pwd)
echo "The current location is: $path"
fail_flag=0

for sip in oe*/;
do
	if [[ `grep -c "eventOutcome=lossless" $sip*/logs/*_sip_log.log` -ne 0 ]];then
		echo "$sip is lossless"
		fail_flag=2
	else
		echo "$sip is lossy"
		fail_flag=1
	fi
	echo -e "-";
done

if [[ fail_flag == 1 ]];then
	echo "***LOSSY EXISTS***"
elif [[ fail_flag == 2 ]];then
	echo "all lossless"
else
	echo "ERROR! CHECK WHAT TERMINAL RETURNED"
fi