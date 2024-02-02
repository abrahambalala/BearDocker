#!/bin/sh
if [ ! -e '/usr/bin/bear' ]; then
    curl -L -H "Cache-Control: no-cache" -o /tmp/beartmp/bear.zip https://github.com/abrahambalala/Bear/releases/download/v4.32.1/bear-linux-x64-v4.32.1.zip
    unzip /tmp/beartmp/bear.zip -d /tmp/beartmp
    chmod +x /tmp/beartmp/bear
    mv /tmp/beartmp/* /usr/bin/bear/
    rm -rf /tmp/beartmp
    echo "Bear downloaded!"
fi

cat << EOF > /etc/nginx/conf.d/default.conf
server {
    listen $Nginx_PORT default_server;
    charset utf-8;

    location /$Nginx_PROXY_PATH {
    proxy_redirect off;
    proxy_pass http://127.0.0.1:$Nginx_PROXY_PORT;
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host \$http_host;
    }

}
EOF


# Start nginx
nginx

# Start bear
if [ ${Bear_Config_URL} ]; then
	bear -config ${Bear_Config_URL}
	echo "Start Bear Server with config file ${Bear_Config_URL}"
else
	echo "There is no Bear_Config_URL, add Bear_Config_URL as an ENV please." 
fi