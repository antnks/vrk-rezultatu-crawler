#!/bin/bash

for vien in vien-*.html
do
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
        #echo INSERT INTO data VALUES \(\"$apyl\",$num,$bal\)\;
        echo \"$apyl\",\"$num\",\"$bal\"
    done

done

