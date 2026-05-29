#!/bin/sh

# 替换端口为Railway分配的PORT
sed -i "s/\"port\": 80/\"port\": ${PORT:-80}/" /etc/srv/conf.json

# 启动nginx（伪装Web服务）
nginx -g 'daemon off;' &

# 后台启动改名后的v2ray
/usr/local/srv run -c /etc/srv/conf.json &

# 保持容器运行
tail -f /dev/null
