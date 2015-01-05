#!/usr/bin/env bash
if [ `whoami` != "root" ]; then
#	sudo passwd root
	exec sudo -c 'sh ./shiftSource.sh'
fi

if [ -e /var/cache/apt/archives/lock ]; then
rm -rf /var/cache/apt/archives/lock
fi
if [ -e /var/lib/dpkg/lock ]; then
rm -rf /var/lib/dpkg/lock
fi
if [ -e /var/lib/apt/lists/lock ]; then
rm -rf /var/lib/apt/lists/lock
fi

SOURCE_FILE=${SOURCE_FILE:-"/etc/apt/sources.list"}
cp $SOURCE_FILE $SOURCE_FILE.bak

if [ ! -e SOURCE_FILE ]; then
touch $SOURCE_FILE
fi

cat <<APT >$SOURCE_FILE
  deb http://mirrors.sohu.com/ubuntu/ trusty main restricted universe multiverse              
  deb http://mirrors.sohu.com/ubuntu/ trusty-security main restricted universe multiverse     
  deb http://mirrors.sohu.com/ubuntu/ trusty-updates main restricted universe multiverse      
  deb http://mirrors.sohu.com/ubuntu/ trusty-proposed main restricted universe multiverse     
  deb http://mirrors.sohu.com/ubuntu/ trusty-backports main restricted universe multiverse    
  deb-src http://mirrors.sohu.com/ubuntu/ trusty main restricted universe multiverse          
  deb-src http://mirrors.sohu.com/ubuntu/ trusty-security main restricted universe multiverse 
  deb-src http://mirrors.sohu.com/ubuntu/ trusty-updates main restricted universe multiverse  
  deb-src http://mirrors.sohu.com/ubuntu/ trusty-proposed main restricted universe multiverse 
  deb-src http://mirrors.sohu.com/ubuntu/ trusty-backports main restricted universe multiverse
APT

#apt-get update
