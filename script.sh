#! /bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install git -y

git clone https://github.com/eskypl/sre-junior-assigment-2023 $HOME/esky

find esky -type f -name "*.tar.bz2" > tarball.txt

read LOGS < tarball.txt 

sudo rm tarball.txt  

tar -xjvsf $LOGS -C $HOME/esky | sed '1d' > temp.txt

read UNZIPPEDPATH < temp.txt


rm temp.txt


cat $HOME/esky/$UNZIPPEDPATH | cut -d " " -f 14 | sed 's/"//g' | sort | uniq -c | awk 'BEGIN {print "ADDRESS     REQUESTS"} {print $2, $1}' | column -t 

rm $HOME/esky/$UNZIPPEDPATH



