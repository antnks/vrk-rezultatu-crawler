#!/bin/bash

wget http://www.vrk.lt/statiniai/puslapiai/rinkimai/102/1/1304/rezultatai/lt/rezultataiDaugmVrt.html -O all.html
for apyg in `grep srcUrl all.html | grep '>[0-9]' | awk -F "=" '{print $4}' | awk -F "'" '{print $1}'`
do
    wget http://www.vrk.lt/statiniai/puslapiai$apyg -O apyg-`basename $apyg`
done

file=$1
if [ -z "$file" ]; then file=apyg-*.html; fi

for apyg in $file
do
	for apyl in `grep srcUrl $apyg | grep '>[0-9]' | awk -F "=" '{print $3}' | awk -F "'" '{print $1}'`
	do
		fname=apyl-`basename $apyl`
	        wget http://www.vrk.lt/statiniai/puslapiai$apyl -O $fname
	done

	if grep "LR diplomatin" $apyg
	then

		emburl=`grep "LR diplomatin" $apyg | grep srcUrl | awk -F "=" '{print $3}' | awk -F "'" '{print $1}'`
		fname=apyg-`basename $emburl`
		wget http://www.vrk.lt/statiniai/puslapiai$emburl -O $fname
		for emb in `grep srcUrl $fname | grep -v align | grep -v h2 | awk -F "=" '{print $3}' | awk -F "'" '{print $1}'`
		do
			wget http://www.vrk.lt/statiniai/puslapiai$emb -O apyl-`basename $emb`
		done
	fi

done

