# 安装v2ray
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

# 更新config文件
wget https://raw.githubusercontent.com/zhliu0106/v2ray-config/main/config.json  -O -> /usr/local/etc/v2ray/config.json

# 测试config
/usr/local/bin/v2ray -test -config /usr/local/etc/v2ray/config.json

# 配置BBR
wget https://raw.githubusercontent.com/zhliu0106/v2ray-config/main/sysctl.conf -O -> /etc/sysctl.conf

# 重启
service v2ray restart