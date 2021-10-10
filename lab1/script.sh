#!/bin/sh

mkdir /home/user/test # 1
ls -la /etc >> /home/user/test/list # 2
find /etc -type d | wc -l >> /home/user/test/list # 3
ls -l -d .?* /etc | wc -l >> /home/user/test/list # 4
mkdir /home/user/test/links # 4
ln /home/user/test/list /home/user/test/links/list_hlink # 5
ln -s /home/user/test/list /home/user/test/links/list_slink # 6
ls -l /home/user/test/links/list_hlink | awk '{print $2}'
ls -l /home/user/test/list | awk '{print $2}'
ls -l /home/user/test/links/list_slink | awk '{print $2}'
wc -l /home/user/test/links >> /home/user/test/list_hlink # 8
cmp --silent /home/user/test/links/list_hlink /home/user/test/links/list_slink && echo "YES" # 9
mv /home/user/test/list /home/user/test/list1 # 10
cmp --silent /home/user/test/links/list_hlink /home/user/test/links/list_slink && echo "YES" # 11
ln /home/user/test/links/list_hlink /home/user/list1  # 12
find /etc/ -type f -name *.conf >> /home/user/list_conf  # 13
find /etc/ -type d -name *.d >> /home/user/list_d # 14
cat /home/user/list_conf /home/user/list_d >> /home/user/list_conf_d # 15
mkdir /home/user/test/.sub # 16
cp /home/user/list_conf_d /home/user/test/.sub/ # 17
cp -b /home/user/list_conf_d /home/user/test/.sub/ # 18
find /home/user/test -print # 19
man man >> /home/user/man.txt # 20
split -b 1k /home/user/man.txt /home/user/x # 21
mkdir /home/user/man.dir # 22
mv /home/user/x** /home/user/man.dir # 23
cat /home/user/man.dir/x** >> /home/user/man.dir/man.txt # 24
cmp --silent /home/user/man.txt /home/user/man.dir/man.txt && echo "YES" # 25
(echo -e 'Hello!\nNice to meet you!\n' && cat /home/user/man.txt) > /home/user/temp && mv /home/user/temp /home/user/man.txt # 26
echo -e 'Goodbye!\nIt was a nice day.' >> /home/user/man.txt # 26
diff -u /home/user/man.txt /home/user/man.dir/man.txt >> /home/user/changes.diff # 27
mv /home/user/changes.diff /home/user/man.dir/ # 28
patch /home/user/man.dir/man.txt /home/user/man.dir/changes.diff # 29
cmp --silent /home/user/man.dir/man.txt /home/user/man.txt && echo "YES" # 30

