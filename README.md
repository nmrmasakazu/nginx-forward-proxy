# nginx-forward-proxy

## Setup

```bash
docker build -t nginx-forward-proxy .
docker run -it --rm -p 80:80 nginx-forward-proxy
# OR
docker run -it --rm -p 80:80 nmrmasakazu/nginx-forward-proxy:latest
```

## You can get info from proxy

by your mac

```bash
curl --proxy http://localhost:80 https://www.yahoo.co.jp
```

by iPhone

1. Go to preferences, Wi-fi
2. Tap information button of your internet
3. Setup proxy information
   1. Manual
   2. Server: IP address of your pc
   3. Port: 80

## demo

```bash
172.17.0.1 - - [09/Jan/2021:08:42:09 +0000] "CONNECT www.yahoo.co.jp:443 HTTP/1.1" 200 44908 "-" "curl/7.64.1"
172.17.0.1 - - [09/Jan/2021:08:41:48 +0000] "CONNECT googleads.g.doubleclick.net:443 HTTP/1.1" 200 4523 "-" "com.apple.WebKit.Networking/8610.3.7.0.3 CFNetwork/1209 Darwin/20.2.0"
```

Thanks

https://github.com/chobits/ngx_http_proxy_connect_module

