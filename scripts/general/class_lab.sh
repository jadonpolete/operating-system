# CS380 Class Lab - BashCommands.txt Answers
# Jadon Polete

#1) List a specific process:
ps aux | grep nginx

#2) Kill by name:
pkill my_script.sh

#3) Background execution:
nohup ./backup.sh &

#4) Find PID:
pidof sshd

#5) Process Hierarchy:
pstree

#6) Open Files:
lsof -p 1234

#7) Check Daemon Status:
systemctl status docker

#8) Priority:
nice -n 19 ./heavy_calc.sh

#9) Recursive copy:
cp -r /var/www/html /backup/html

#10) Preserve Attributes:
cp -a secret.key /tmp/

#11) Sync Directories:
rsync -av --update src/ dest/

#12) Update Copy:
cp -u dir1/* dir2/

#13) Remove Copy:
scp app.conf user@192.168.1.50:/etc/

#14) Archive & Compress:
tar -czvf logs.tar.gz /var/log

#15) Size Search:
find /home -type f -size +500M

#16) Time Search:
find /var/log -mtime -7

#17) User Search:
find /tmp -user jenkins

#18) Find & Delete:
find /data -type d -empty -delete

#19) Permission Search:
find . -type f -perm 777

#20) Find & Copy:
find . -name "*.jpg" -exec cp {} /images/ \;

#21) Email Extraction:
grep -E "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" contacts.txt

#22) Case Insensitive Search:
grep -i error syslog

#23) Line Start Anchor:
grep "^root" config.ini

#24) Invert Match:
grep -v "192.168.1.1" access.log

#25) Recursive Grep:
grep -R "TODO" .

#26) Sed Replace:
sed -i 's/localhost/127.0.0.1/g' hosts.txt

#27) Comment Removal:
grep -v "^#" config.conf

#28) IP Validation:
grep -E "^([0-9]{1,3}\.){3}[0-9]{1,3}$" file.txt

#29) Process & Regex:
ps aux | grep "^root"

#30) Find, Regex & Execute:
find . -name "*.log" -exec grep -l "Critical" {} \;
