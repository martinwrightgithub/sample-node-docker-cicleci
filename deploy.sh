#!/bin/bash
docker build -t martinwrightuk/sample-node .
docker push martinwrightuk/sample-node

ssh deploy@159.203.127.59 << EOF
docker pull martinwrightuk/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi martinwrightuk/sample-node:current || true
docker tag martinwrightuk/sample-node:latest martinwrightuk/sample-node:current
docker run -d --net app --restart always --name web -p 3000:3000 martinwrightuk/sample-node:current
EOF
