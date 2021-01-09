#!/usr/bin/env bash
/usr/local/nginx/sbin/nginx
tail /usr/local/nginx/logs/access.log -f
