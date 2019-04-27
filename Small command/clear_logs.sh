#!/bin/bash
#获取主机上的java进程
java_process=$(ps aux |grep java |grep -v grep  |awk -F "base=" '{print $2}'|awk '{print $1}' |grep -v ^$)
for i in $java_process
do
#查找进程下logs目录中7天以前的3种类型的日志并删除
find $i/logs/ -name "*.out" -o -name "*.txt" -o -name "*.log"  -mtime +7
done 

