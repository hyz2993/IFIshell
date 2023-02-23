#! /bin/bash

local_path=$(dirname $0)
cd $local_path
pwd
echo "This shell script is written by Yazhou He"

echo -e "---\ncheck wav md5"
sleep 2
for dir in *C-*/Wav/;
do
    echo "object $dir processing" 
    cat "$dir"*.md5
    md5 "$dir"*.wav
    echo "-";
done
echo -e "Go back and compare all audio checksums.\nPress any [key] and enter to continue"
read any_key

echo -e "---\nmove wav to image folder"
sleep 2
for dir in *C-*/;
do
    echo "object $dir processing"
    mv "$dir"Wav/*.wav "$dir"*x*/
    echo "-";
done

echo -e "---\nmove checksum to parent folder"
sleep 2
for dir in *C-*/; 
do
    echo "object $dir processing"
    mv "$dir"*/CHECKSUM.md5 "$dir"
    echo "-";
done

echo -e "---\nrename manifest"
sleep 2
for dir in *C-*/*x*/; 
do
    res1="${dir: -10}"
    res="${res1::9}"
    path="${dir%%$res*}"
    echo "object $path processing"
    echo "resoluation: $res"
    mv "$path"CHECKSUM.md5 "$path""$res"_manifest.md5
    echo "-";
done

echo -e "---\nchange structure"
sleep 2
for dir in *C-*/;
do
    echo "object $dir processing"
    filename=$(ls $dir*_manifest.md5)
    res1=${filename%%_manifest*}
    res=${res1: -9}
    echo "$filename has found, res:$res, generating copy"
    cat $filename | tr "[:upper:]" "[:lower:]" > "$dir""$res"_manifest2.md5
    sed -i "" "s/\*\c/\ $res\/C/" "$dir""$res"_manifest2.md5
    echo "-";
done

echo -e "---\nvalidation"
sleep 2
for dir in *C-*/;
do
    echo "-"
    filename=$(ls $dir*_manifest2.md5)
    echo "validate for $filename"
    result=$(validate.py -y $local_path/$filename);
echo $result
done