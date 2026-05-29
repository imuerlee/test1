# 基础镜像换为轻量Alpine，不直接用v2fly官方镜像
FROM alpine:3.18

# 安装必要工具，不直接暴露v2ray
RUN apk add --no-cache wget unzip nginx

# 下载v2ray并改名、隐藏路径
RUN wget -q https://github.com/v2fly/v2ray-core/releases/download/v4.45.0/v2ray-linux-64.zip \
    && unzip -q v2ray-linux-64.zip -d /usr/local/ \
    && mv /usr/local/v2ray /usr/local/srv \
    && chmod +x /usr/local/srv \
    && rm -rf v2ray-linux-64.zip

# 复制伪装文件与配置
COPY web/ /var/lib/nginx/html/
COPY conf.json /etc/srv/
COPY run.sh /
RUN chmod +x /run.sh

# 暴露80端口（伪装Web）
EXPOSE 80

# 启动脚本
CMD ["/run.sh"]
