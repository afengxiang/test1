FROM alpine:latest

# 安装必要的基础运行库
RUN apk add --no-cache ca-certificates bash

WORKDIR /app

# 直接复制你仓库里已经存在的二进制文件和配置
COPY . .

# 重命名回程序需要的名字（或者直接在 start.sh 里改名字运行）
RUN mv sys-server /usr/local/bin/sing-box && \
    mv sys-tunnel /usr/local/bin/cloudflared && \
    chmod +x /usr/local/bin/sing-box /usr/local/bin/cloudflared /app/start.sh

# 暴露端口
EXPOSE 8080

CMD ["./start.sh"]
