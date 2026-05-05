FROM alpine:latest
RUN apk add --no-cache ca-certificates bash
WORKDIR /app
COPY . .
# 赋予执行权限并放回路径
RUN chmod +x web-app sys-service start.sh && \
    mv web-app /usr/local/bin/sing-box && \
    mv sys-service /usr/local/bin/cloudflared
EXPOSE 8080
CMD ["./start.sh"]
