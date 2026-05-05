FROM alpine:latest

# 安装 sing-box 和 cloudflared
RUN apk add --no-cache ca-certificates curl && \
    curl -L https://github.com/SagerNet/sing-box/releases/download/v1.8.5/sing-box-1.8.5-linux-amd64.tar.gz | tar xz && \
    mv sing-box-*/sing-box /usr/local/bin/ && \
    curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/local/bin/cloudflared && \
    chmod +x /usr/local/bin/sing-box /usr/local/bin/cloudflared

WORKDIR /app
COPY . .
RUN chmod +x start.sh

CMD ["./start.sh"]
