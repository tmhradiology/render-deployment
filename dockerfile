FROM alpine:latest
RUN apk add --no-cache curl busybox-extras && \
    curl -L -o /tmp/chisel.gz https://github.com/jpillora/chisel/releases/latest/download/chisel_linux_amd64.gz && \
    gunzip /tmp/chisel.gz && mv /tmp/chisel /usr/local/bin/chisel && chmod +x /usr/local/bin/chisel
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
