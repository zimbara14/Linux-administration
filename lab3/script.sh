#!/bin/bash

awk -F: '{print "user " $1 " has ID " $3}' /etc/passwd > /home/user/lab3/work3.log # 1

chage -l root | head -n 1 | awk -F: '{print "Last password change of root: " $2}' >> /home/user/lab3/work3.log # 2

getent group | cut -d: -f1 | paste -d',' -s >> /home/user/lab3/work3.log # 3

echo "Be careful!" > /etc/skel/readme.txt # 4

useradd u1 -p $(openssl passwd -crypt 12345678) # 5

groupadd g1 # 6

usermod -a -G g1 u1 # 7

echo "/n" >> /home/user/lab3/work3.log # 8
id u1 >> /home/user/lab3/work3.log # 8

usermod -a -G g1 user # 9

getent group g1 | awk -F: '{print $4}' >> /home/user/lab3/work3.log # 10

usermod -s /usr/bin/mc u1 # 11

useradd u2 -p $(openssl passwd -crypt 87654321) # 12

mkdir /home/test13 # 13
cp /home/user/lab3/work3.log work3-1.log # 13
cp /home/user/lab3/work3.log work3-2.log # 13

chown -R u1:u2 /home/test13 # 14
chmod 640 /home/test13 # 14

mkdir /home/test14 # 15
chmod +t /home/test14 # 15
chown u1:u1 /home/test14 # 15

cp /bin/nano /home/test14/nano # 16
chown u1:u1 /home/test14/nano # 16
chmod u+s /home/test14/nano # 16

mkdir /home/test15 # 17
touch /home/test15/.secret_file # 17
chmod 111 /home/test15 # 17
chmod 444 /home/test15/.secret_file # 17
