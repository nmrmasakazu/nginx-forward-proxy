FROM centos:centos7

WORKDIR /proxy

COPY ./nginx.conf ./start.sh ./

RUN chmod +x ./start.sh

RUN yum install -y wget git patch gcc pcre pcre-devel openssl openssl-devel gd gd-devel

RUN wget http://nginx.org/download/nginx-1.9.2.tar.gz \
    && tar -xzvf nginx-1.9.2.tar.gz \
    && git clone https://github.com/chobits/ngx_http_proxy_connect_module.git

RUN cd nginx-1.9.2/ \
    && patch -p1 < /proxy/ngx_http_proxy_connect_module/patch/proxy_connect.patch \
    && ./configure --add-module=/proxy/ngx_http_proxy_connect_module \
    && make && make install \
    && cp -f /proxy/nginx.conf /usr/local/nginx/conf/nginx.conf

CMD ["./start.sh"]
