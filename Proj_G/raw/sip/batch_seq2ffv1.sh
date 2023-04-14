#! /bin/bash

echo -e "\nThis shell script is written by Yazhou He\n"
local_path=$(dirname $0)
cd $local_path
path=$(pwd)
echo -e "Usage: batch processing seq2ffv1.py.
Script is located at: $path
\nPlease make sure the script has been relocated INTO the psm folder!
Please make sure there is NO space in both INPUT & OUTPUT directory!
psm/-
    |- batch_seq2ffv1.py
    |- raw_object_1
    |- raw_object_2
    |- ..."
sleep 1

echo -e "\nInput start OE number:
(NB: OE number must start with oe and then digits!)"
read start_oen
oen=${start_oen#*oe}
# or manually leave the oe number below with just digits (formatted '12345', no 'oe')
# don't forget to comment the above lines :)
# oen=
sleep 1

echo -e "\nInput user:"
read user
echo -e "Welcome $user!"
sleep 1

echo -e "\nInput/Drag output path:"
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
	commd="[seq2ffv1.py -i $i_path -o $o_path -oe oe$oen -user "$user"]"
    echo -e "$commd\n"
    sleep 2
    # manually input the username here, formatted 'Forname\ Surname', ie'Yazhou\ He'
	process=$(seq2ffv1.py -i $i_path -o $o_path -oe oe$oen -user "$user")
    echo "$process"
    echo -e "\n--- oe$oen SIP has procceed. Manually check result. ---\n"
    let oen+=1;
done

