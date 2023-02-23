#! /bin/bash

local_path=$(dirname $0)
cd $local_path
pwd
mkdir proxy
echo "This shell script is written by Yazhou He"
sleep 1

for dir in *oe*/*/objects/*.mkv;
do
    filename="${dir::89}"
    oen="${dir::7}"
    echo "object $dir transcoding to ${filename}_h264.mov"
    echo "ffmpeg -i $dir -c:v libx264 -c:a aac ${filename}_h264.mov"
    ffmpeg -i $dir -c:v libx264 -c:a aac ${filename}_h264.mov
    echo "object $oen transcoded to h264!"
    mv ${filename}_h264.mov $local_path/proxy/${oen}_h264.mov
    echo -e "\n---\n"
    sleep 60
    echo "object $dir transcoding to ${filename}_prores.mov"
    echo "prores.py $dir"
    prores.py $dir
    echo "object $oen transcoded to prores!"
    mv ${dir}_prores.mov $local_path/proxy/${oen}_prores.mov
    echo -e "\n---\n"
    sleep 60;
done
