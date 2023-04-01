#!/bin/bash

#make dirs
mkdir -p co/{denver,boulder} ca ma/boston

#generate small text files
base64 /dev/urandom | head -c 1024 > 1K.txt
base64 /dev/urandom | head -c 819200 > 800K.txt
base64 /dev/urandom | head -c 10485760 > 10M.txt
base64 /dev/urandom | head -c 104857600 > 100M.txt


base64 /dev/urandom | head -c 1024 >co/1K.txt
base64 /dev/urandom | head -c 81920 >co/80K.txt
base64 /dev/urandom | head -c 20480 > ca/20K.txt
base64 /dev/urandom | head -c 1048576 > ca/1M.txt
base64 /dev/urandom | head -c 102400 > ma/100K.txt
base64 /dev/urandom | head -c 1048576 > ma/1M.txt

#generate non-text files
head -c 1024 </dev/urandom> co/1K.img
head -c 102400 </dev/urandom> co/100K.img
head -c 819200 </dev/urandom> co/800K.img
head -c 2097152 </dev/urandom> co/2M.img
head -c 10485760 </dev/urandom> co/10M.img
head -c 104857600 </dev/urandom> co/100M.img
head -c 3221225472 </dev/urandom> co/3G.img
#head -c 10737418240 </dev/urandom> co/10G.img #uncomment this line to generate a file of 10G in size

head -c 20971520 </dev/urandom> ca/20M.img
head -c 209715200 </dev/urandom> ca/200M.img

head -c 31457280 </dev/urandom> ma/30M.img
head -c 314572800 </dev/urandom> ma/300M.img
head -c 1048576000 </dev/urandom> ma/1G.img

cp co/3G.img co/denver
cp ma/1G.img co/boulder

ln -rsnf co/3G.img co/boulder/link_to_3G.img
ln -rsnf ca/* ma/boston

chmod -R -w co  #test 
