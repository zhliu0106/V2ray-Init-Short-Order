# 安装v2ray
# bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

# 更新config文件
wget https://raw.githubusercontent.com/zhliu0106/v2ray-config/main/config.json  -O -> /usr/local/etc/v2ray/config.json

# 随机初始化端口与shadowsocks密码
function rand(){
  min=$1
  max=$(($2-$min+1))
  num=$(($RANDOM+1000000000))
  echo $(($num%$max+$min))
}

usr_123=$(openssl rand -hex 4)
usr_456=$(openssl rand -hex 4)
pw_123=$(openssl rand -hex 4)
pw_456=$(openssl rand -hex 4)
port_123=$(rand 1001 2000)
port_456=$(rand 2001 3000)

sed -i "s/username_123/$usr_123/g" /usr/local/etc/v2ray/config.json
sed -i "s/username_456/$usr_456/g" /usr/local/etc/v2ray/config.json
sed -i "s/password_123/$pw_123/g" /usr/local/etc/v2ray/config.json
sed -i "s/password_456/$pw_456/g" /usr/local/etc/v2ray/config.json
sed -i "s/port_123/$port_123/g" /usr/local/etc/v2ray/config.json
sed -i "s/port_456/$port_456/g" /usr/local/etc/v2ray/config.json


# 测试config
/usr/local/bin/v2ray -test -config /usr/local/etc/v2ray/config.json

# 配置BBR
wget https://raw.githubusercontent.com/zhliu0106/v2ray-config/main/sysctl.conf -O -> /etc/sysctl.conf

# 重启
service v2ray restart

# 输出端口密码
echo -e "protocol:SOCKS5"
echo -e "port:$port_123\tusername:$usr_123\tpassword:$pw_123"
echo -e "port:$port_456\tusername:$usr_456\tpassword:$pw_456"
