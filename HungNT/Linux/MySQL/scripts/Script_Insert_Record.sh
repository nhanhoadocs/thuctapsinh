#!/bin/bash -e
# Script cai lamb và wordpress
echo -n "Dat ten MySQL DB : "
read mysqldb

echo -n "Dat ten table trong database:"
read mysqltb

echo -n "Nhap mat khau mysql:"
read  rootpass
if [ "${rootpass}" == "" ]
then
    rootpass=""
else
    rootpass="-p${rootpass}"
fi


mysql -u root --password=$rootpass<<sql.sh
CREATE DATABASE $mysqldb ;
use $mysqldb;
create table $mysqltb(id int(3),name varchar(10));
 exit
sql.sh

chars=( {a..z} )
numbs=( {1..100} )
n=100
for((i=0;i<n;i++))
do
mysql -u root --password=$rootpass<<sql.sh
use $mysqldb;
 insert into $mysqltb(id,name) values(${numbs[i]},'${chars[i]}');
 exit
sql.sh
done
