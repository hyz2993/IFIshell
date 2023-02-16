for obj in */aaa*; do
	i=1
	echo $obj
	cd $(pwd)/${obj}/*/objects/
	for mp4 in *.MOV;do
		echo $obj
		a=${obj:0-7}
		echo $a
		cp -r -n $mp4  /d/Ballymun_Hardrive_proxies_mezz/big_mov/${a}_${i}.MOV
		i=$((i+1))
	done
	cd ../../../../
done