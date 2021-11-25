wget no-check-certificate https://raw.githubusercontent.com/Lozy/danted/master/install_centos.sh -O install.sh
username=$(openssl rand -hex 3)
password=$(openssl rand -hex 3)
port_num=$(date +%N | cut -c 1-3)
port_num=$((port_num+1000))
bash install.sh --port=$port_num --user=$username --passwd=$password

# 获取公网ip相关信息
curl ipinfo.io > test
# 使用正则表达式提取ip
myip=$(grep -E '"ip": "(.*)"' test | cut -d \" -f 4)
echo "$myip/$port_num/$username/$password"

