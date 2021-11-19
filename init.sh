# 安装v2ray
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

# 更新config文件
wget https://raw.githubusercontent.com/zhliu0106/v2ray-config/main/config.json  -O -> /usr/local/etc/v2ray/config.json

# 随机初始化123与456端口的shadowsocks密码
pw_123=$(openssl rand -hex 4)
pw_456=$(openssl rand -hex 4)

sed -i "s/pw_123/$pw_123/g" /usr/local/etc/v2ray/config.json
sed -i "s/pw_456/$pw_456/g" /usr/locab/etc/v2ray/config.json

# 测试config
/usr/local/bin/v2ray -test -config /usr/local/etc/v2ray/config.json

# 配置BBR
wget https://raw.githubusercontent.com/zhliu0106/v2ray-config/main/sysctl.conf -O -> /etc/sysctl.conf

# 重启
service v2ray restart

# 输出端口密码
echo "protocol:\tshadowsocks\nmethod:\taes-256-gcm\n"
echo "port:\t123\tpassword:\t$pw_123\n"
echo "port:\t456\tpassword:\t$pw_456\n"