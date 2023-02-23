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
    echo "bitc.py -clean $dir"
    #bitc.py used here by Gavin Martin instead of ffmpeg etc due to cpu overhead issues
    bitc.py -clean $dir
    echo "object $oen transcoded to h264!"
    mv ${dir}_h264.mov $local_path/proxy/${oen}_h264.mov
    echo -e "\n---\n"
    sleep 60
    echo "object $dir transcoding to ${filename}_prores.mov"
    echo "prores.py $dir"
    prores.py -hq $dir
    echo "object $oen transcoded to prores!"
    mv ${dir}_prores.mov $local_path/proxy/${oen}_prores.mov
    echo -e "\n---\n"
    sleep 60;
done