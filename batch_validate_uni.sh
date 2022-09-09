#! /bin/bash

# auto-relocate in the next 2 lines, if diesabled, use cd to relocate manually before scripts run
#local_path=$(dirname $0)
#cd $local_path

# pwd shows the current path we are in
pwd
local_path=$(pwd)
sleep 0.5

echo "This shell script is written by Yazhou He.
		It's a universal version for dpx&wav validation.
		The DPX folder is now named Scan;
		The WAV folder should be named WAV"

	echo -e "---\n\ncheck wav md5"
	sleep 2
	for dir in */Wav/;
	do  
	    echo "object $dir processing"
	    cat "$dir"*.md5
	    md5 "$dir"*.wav
	    echo "-";
	done



	echo -e "Go back and compare all audio checksums.\nPress any [key] and enter to continue"
	read any_key



	echo -e "---\n\nmove wav to image folder"
	sleep 2
	for dir in *;
	do
	    echo "object $dir processing"
	    mv "$dir"Wav/*.wav "$dir"Scan/
	    echo "-";
	done



	echo -e "---\n\nmove checksum to parent folder"
	sleep 2
	for dir in */;
	do
	    echo "object $dir processing"
	    mv "$dir"*/CHECKSUM.md5 "$dir"
	    echo "-";
	done



	#echo -e "---\nrename manifest"
	#sleep 2
	#for dir in */Scan/;
	#do
	    #res1="${dir: -10}"
	    #res="${res1::9}"
	    #path="${dir%%$res*}"
	    #echo "object $path processing"
	    #echo "resoluation: $res"
	    #mv "$path"CHECKSUM.md5 "$path""$res"_manifest.md5
	    #echo "-";
	#done



	echo -e "---\n\nchange structure"
	sleep 2
	for dir in */;
	do
	    echo "object $dir processing"
	    filename="$dir"CHECKSUM.md5
	    #res1=${filename%%_manifest*}
	    #res=${res1: -9}
	    echo "$filename has found generating copy"
	    cat $filename | tr "[:upper:]" "[:lower:]" > "$dir"CHECKSUM2.md5
	    sed -i "" 's/\*/ Scan\//' "$dir"CHECKSUM2.md5
	    echo "-";
	done



	echo -e "---\n\nvalidation"
	sleep 2
	for dir in */;
	do
		echo "-"
		filename="$dir"CHECKSUM2.md5
		echo "validating $filename"
		target_md5=$local_path/$filename
		target_md5=${target_md5// /\\ }
		echo "Target: $target_md5" > "$local_path"/"$dir"/val_result.txt
		validate.py -y "$target_md5" >> "$local_path"/"$dir"/val_result.txt
        tr '\r' '\n' > "$dir"val_result.txt
		sed -i "" "/%/d" "$dir"val_result.txt
        echo "checking $dirval_result.txt"
        grep -c "All checksums have validated" "$dir"val_result.txt
		if [ `grep -c "All checksums have validated" "$dir"val_result.txt` -ne '0' ]
		    then
		        echo "$dir All checksums validated"
		    else
		        echo "ERROR: [CHECK THE RESULT TEXT FILE]"
		    fi
	done