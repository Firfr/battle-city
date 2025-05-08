FROM node:12.22.12-alpine AS build
WORKDIR /app
COPY . .
RUN npm config set registry https://registry.npmmirror.com && \
    npm install && \
    npm run build

FROM lipanski/docker-static-website:2.4.0
# 静态文件路径 /home/static
COPY --from=build /app/dist /home/static/
#CMD ["/busybox-httpd", "-f", "-v", "-p", "3000", "-c", "httpd.conf"]

# docker build -t firfe/battle-city:2025.05.08 .

