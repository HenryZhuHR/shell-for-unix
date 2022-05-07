P=1577001

echo "进程所属用户:`ps aux | awk '$2~/^'$P'$/ {print $1}'`"

#筛选第二列等于输入的PID号
n=`ps aux | awk '$2~/^'$P'$/ {print $11}' | wc -l`

if [ $n -eq 0 ];then
        echo "该PID不存在!"
        exit
fi

echo "--------------------------------"
echo "进程PID: $P"
echo "进程命令:`ps aux | awk '$2~/^'$P'$/ {print $11}'`"
echo "进程所属用户:`ps aux | awk '$2~/^'$P'$/ {print $1}'`"
echo "CPU占用率:`ps aux | awk '$2~/^'$P'$/ {print $3}'`"
echo "内存占用率:`ps aux | awk '$2~/^'$P'$/ {print $4}'`"
echo "进程开始运行时间:`ps aux | awk '$2~/^'$P'$/ {print $9}'`"
echo "进程运行的持续时间:`ps aux | awk '$2~/^'$P'$/ {print $10}'`"
echo "进程状态:`ps aux | awk '$2~/^'$P'$/ {print $8}'`"
echo "进程虚拟内存:`ps aux | awk '$2~/^'$P'$/ {print $5}'`"
echo "进程共享内存:`ps aux | awk '$2~/^'$P'$/ {print $6}'`"
echo "--------------------------------"

