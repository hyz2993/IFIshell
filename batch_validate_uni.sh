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
	
echo -e "---\n\ncheck wav md5\n"
sleep 2
for dir in */Wav/;
do  
    echo "object $dir processing"
    cat "$dir"*.md5
    md5 "$dir"*.wav
    echo -e "\n";
done

echo -e "Go back and compare all audio checksums.\nPress any [key] and enter to continue"
read any_key

echo -e "---\n\nmove wav to image folder\n"
sleep 2
for dir in */;
do
    echo "object $dir processing"
    mv "$dir"Wav/*.wav "$dir"Scan/
done

echo -e "---\n\nmove checksum to parent folder\n"
sleep 2
for dir in */;
do
    echo "object $dir processing"
    mv "$dir"*/CHECKSUM.md5 "$dir"
done

#echo -e "---\nrename manifest\n"
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

echo -e "---\n\nchange structure\n"
sleep 2
for dir in */;
do
    echo "object $dir processing"
    filename="$dir"CHECKSUM.md5
    echo "$filename has found generating copy"
    cat $filename | tr "[:upper:]" "[:lower:]" > "$dir"CHECKSUM2.md5
    # change manifest content from *MB.... to Scan/... as the manifest location changed
    # sed -i(modify file) "" 's/$need_to_be_replaced/$replace_to/' "file"
    sed -i "" 's/\*/ Scan\//' "$dir"CHECKSUM2.md5
done

echo -e "---\n\nvalidation\n"
sleep 2
for dir in */;
do
    filename="$dir"CHECKSUM2.md5
    batch=${dir%?}
    echo "Validating ${batch}"
    target_md5=$local_path/$filename
    target_md5=${target_md5// /\\ }
    echo -e "Target: ${target_md5}\n" > "$local_path"/"$dir"validation_result.txt
    validate.py -y "$target_md5" >> "$local_path"/"$dir"validation_result.txt
    cat ${local_path}/${dir}validation_result.txt | tr '\r' '\n' > "$dir""$batch"_validation_result.txt
    sed -i "" "/%/d" ${dir}${batch}_validation_result.txt
    rm "$local_path"/"$dir"validation_result.txt
    echo "Result exported to ${batch}_validation_result.txt"
    #grep -c "All checksums have validated" ${dir}${batch}_validation_result.txt
    if [ `grep -c "All checksums have validated" ${dir}${batch}_validation_result.txt` -ne '0' ]
        then
            echo "${dir} All checksums validated"
        else
            echo "ERROR: [CHECK THE FAILURE LIST AT THE END OF ${batch}_validation_result.txt]"
            list_output=`grep -n "List of mismatched files" ${dir}${batch}_validation_result.txt`
            #list_num=`awk '/"List of mismatched files"/{print NR}' ${dir}${batch}_validation_result.txt`
            tail -n +${list_output%%:*} ${local_path}/${dir}${batch}_validation_result.txt
        fi
    echo -e "\n";
done