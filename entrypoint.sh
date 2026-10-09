#!/bin/sh
echo "$AUTHFILE_JSON" > /users.json
mkdir -p /camo && echo '<html><body><h1>OK</h1></body></html>' > /camo/index.html
busybox httpd -p 127.0.0.1:8000 -h /camo &
exec chisel server --port "$PORT" --reverse \
  --authfile /users.json \
  --backend http://127.0.0.1:8000 -v
