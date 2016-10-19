#!/bin/bash

for vien in apyl-*.html
do
	apyg=`grep h2 $vien | head -n 1 | awk -F ">" '{print $3}' | awk -F "<" '{print $1}'`
	apyl=`grep h3 $vien | tail -n 1 | cut -c 5- | rev |  cut -c 7- | rev`

	start=43
	shifta=5
	shiftb=6

	for i in {1..14}
	do
		num=`sed -n ${start}p $vien | awk -F ">" '{print $2}' | awk -F "<" '{print $1}'`
		(( start += shifta))
		bal=`sed -n ${start}p $vien | awk -F ">" '{print $2}' | awk -F "<" '{print $1}'`
		(( start += shiftb))
		echo \"$apyg\",\"$apyl\",\"$num\",\"$bal\"
	done

done

