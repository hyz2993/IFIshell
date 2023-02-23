#! /bin/bash

echo -e "\nThis shell script is written by Yazhou He\n"
local_path=$(dirname $0)
cd $local_path
path=$(pwd)
echo -e "Usage: sip for all psm objects under a batch.\nscript located in: $path"
sleep 1

# echo -e "\nInput user"
# read user
# echo -e "Welcome $user!"
# sleep 1

echo -e "\nInput start OE number formatted 'oe12345'"
read start_oen
oen=${start_oen#*oe}
# or manually leave the oe number below with just numbers (formatted '12345', no 'oe')
# don't forget to comment the above lines :)
# oen=
sleep 1

echo -e "\nInput/Drag output path"
read o_path
echo -e "Output path: $o_path"
echo -e "**********\n"
sleep 1

# change the directory key character here if needed:
# for now, it refers to '[G]PR_[MK]08_01_0043_08[/]4096[x]3112[/]' 
# also                  '[G]DB_[MK]08_01_0062_12[/]4096[x]3112[/]'
for dir in *G*MK*/*x*/; 
do
    i_path="$path/${dir%/}"
    echo -e "\nInput path: $i_path"
    echo -e "oe number:  oe$oen"
    # have to manually leave the username here, formatted 'Forname\ Surname'
	commd="$HOME/ifigit/ifishells/seq2ffv2.py -i $i_path -o $o_path -oe oe$oen -user Yazhou\ He"
    echo -e "$commd\n"
    sleep 2
    # also changed username here, formatted 'Forname\ Surname'
	# process=$($HOME/ifigit/ifishells/seq2ffv2.py -i $i_path -o $o_path -oe oe$oen -user Yazhou\ He)
    echo "$process"
    echo -e "\n--- oe$oen SIP has procceed. Manually check result. ---\n"
    let oen+=1;
done

