#!/usr/bin/env bash
#by Myki
#只备份数据不备份话单
#停止vos程序
/etc/init.d/vos3000d stop
/etc/init.d/mbx3000d stop
/etc/init.d/vos3000webct stop
/etc/init.d/mgcserverd stop
/etc/init.d/phoneserviced stop
/etc/init.d/vos3000websv stop
/etc/init.d/callserviced stop
/etc/init.d/httpd stop
/etc/init.d/mysql stop

tar -zxvf vos3000.tar.gz backup/
rm -rf /var/lib/mysql/vos3000/*
cp -dprf backup/* /var/lib/mysql/vos3000/
rpm -e vos3000
rpm -Uvh vos3000
