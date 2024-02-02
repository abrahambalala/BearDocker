BearDocker
---
Default ENV
- Nginx_PORT=8080
- Nginx_PROXY_PORT=22333
- Nginx_PROXY_PATH=nginxtobear
- WebTemplate=https://github.com/abrahambalala/BearDocker/releases/download/website/website.zip
- Bear_VERSION=v4.32.1
- Bear_Config_URL=

Nginx_PORT can be changed to coordinate with your service.

WebTemplate can be changed to use your own website.

Bear_Config_URL can't be none, therefor you must provide the Bear_Config_URL ENV when start beardocker. And port & path in Bear's Bear_Config_URL must match to Nginx_PROXY_PORT & Nginx_PROXY_PATH.
