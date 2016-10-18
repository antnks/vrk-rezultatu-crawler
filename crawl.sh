#!/bin/bash

wget http://www.vrk.lt/statiniai/puslapiai/rinkimai/102/1/1304/rezultatai/lt/rezultataiDaugmVrt.html -O all.html
for apyl in `grep srcUrl all.html | grep '>[0-9]' | awk -F "=" '{print $4}' | awk -F "'" '{print $1}'`
do
    wget http://www.vrk.lt/statiniai/puslapiai$apyl -O apyl-`basename $apyl`
done

for apyl in apyl-*.html
do
    for vien in `grep srcUrl $apyl | grep '>[0-9]' | awk -F "=" '{print $3}' | awk -F "'" '{print $1}'`
    do
        wget http://www.vrk.lt/statiniai/puslapiai$vien -O vien-`basename $vien`
    done
done

