#! /bin/bash

# auto-relocate in the next 2 lines, if diesabled, use cd to relocate manually before scripts run
echo -e "This script is located in: $(dirname "$0")"
local_path=$(dirname $0)
cd $local_path

# pwd shows the current path we are in
local_path=$(pwd)
echo -e "Relocated processing path: $local_path"
sleep 0.5

echo "	This shell script is written by Yazhou He.
		It's for validation of treated ProRes media files.
	"

failed_bool=0

if [[ `ls */*/` ]];then
	echo -e "ProRes objects have found!\n"
	for dir in */*/;
    do
    	if [[ `ls ${dir}*.mov` ]];then
    		if [[ `ls ${dir}*.md5` ]];then
    			echo "object ${dir%?} processing"
    			echo "-"
    			cat "$dir"*.md5
    			md5 "$dir"*.mov
    			echo "-"
    			manifest_md5=`cat "$dir"*.md5 | tr "[:upper:]" "[:lower:]"`
    			manifest_md5=`echo $manifest_md5 | cut -d "*" -f 1`
    			mov_md5=`md5 "$dir"*.mov`
    			mov_md5=${mov_md5#*= }
    			echo -e "manifest checksum: \t $manifest_md5"
    			echo -e "audio file checksum: \t $mov_md5"
    			target_movmd5=$local_path/$dir
    			if [ $manifest_md5 == $mov_md5 ];then
    				echo "${dir%?} checksum match!"
    			else
                    echo "${dir%?} has mismatched checksum - $manifest_md5 expected - $mov_md5 hashed"
    				echo "${dir%?} has mismatched checksum - $manifest_md5 expected - $mov_md5 hashed" >> validation_result.txt
                    failed_bool=1
    			fi
    			echo -e "\n";
    		else
    			echo "no md5 is found in ${dir%?}"
    		fi
    	else
    		echo "no ProRes file is found in ${dir%?}"
    	fi
    done
else
	echo "\nno ProRes objects found"
fi
	
if [ $failed_bool == 0 ];then
    echo -e "***all files have validated***"
else
    echo -e "***ATTENTION - mismatched checksum has found***"
    cat validation_result.txt
fi