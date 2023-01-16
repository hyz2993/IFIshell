#! /bin/bash

echo -e "\nThis shell script is written by Yazhou He\n"
local_path=$(dirname $0)
cd $local_path
path=$(pwd)
echo -e "SIP for all psm objects.\nscript located in: $path"
sleep 1

##echo -e "\nInput user"
##read user
##echo -e "Welcome $user!"
##sleep 1

echo -e "\nInput start OE number"
read start_oen
oen=${start_oen#*oe}
sleep 1

echo -e "\nInput/Drag output path"
read o_path
echo -e "Output path: $o_path"
echo -e "**********\n"
sleep 1

for dir in *G*/*x*/; 
do
    i_path="$path/${dir%/}"
    echo -e "\nInput path: $i_path"
    echo -e "oe number:  oe$oen"
    commd="seq2ffv2.py -i $i_path -o $o_path -oe oe$oen -user Yazhou\ He"
    echo -e "$commd\n"
    sleep 2
    process=$(seq2ffv2.py -i $i_path -o $o_path -oe oe$oen -user Yazhou\ He)
    echo "$process"
    echo -e "\n--- oe$oen SIP has procceed. Manually check result. ---\n"
    let oen+=1;
done

## SAMPLE - /Users/admin/ifigit/IFIscripts_test/IFIscripts/seq2ffv2.py -user Yazhou\ He -o /Volumes/G-RAID1/guinness/batch_05/sips -oe oe18573 -i /Volumes/IFI_Guinness/Raw_DPX_Scans/Batch_05/psm 4.36_C-1147237/4096x3112
