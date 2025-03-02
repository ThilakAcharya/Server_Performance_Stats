
#!/bin/bash

echo "---------------------- CPU usage ----------------------"
#CPU usage
top -bn1 | grep "Cpu(s)" | grep -oE '[0-9.]* id'|awk '{print"Total CPU Usage: " 100-$1"%"}'

echo "---------------------- Memory Usage --------------------"
#Memory Usage 
free -h| grep 'Mem' |awk '{print "Memory Used : "$3" Free : "$2-$3" In % : "$3/$2*100"%"}'
echo " "
echo "---------------------- Storage Usage --------------------"

#storage Usage
df -h --total |awk '/^total/{print "Total : "$2" Used : "$3" Free : "$4" Use%: "$5}'

echo " "
echo "---------------------- Top 5 CPI Usage --------------------"

#top CPU Use
ps -eo user,pid,start_time,%cpu,comm --sort=-%cpu | head -6

echo " "
echo "---------------------- TOP 5 MEM Usage --------------------"

#top 5 MEM use
ps -eo user,pid,start_time,%mem,comm --sort=-%mem | head -6
