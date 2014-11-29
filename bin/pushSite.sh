#!/bin/bash

grunt build

cd dist/ && tar -zcvf ../dist.tar.gz . && cd ..

scp dist.tar.gz root@128.199.201.228:/tmp/

ssh root@128.199.201.228 "
  rm -rf /var/www/
  mkdir /var/www
  cd /var/www
  tar -zxf /tmp/dist.tar.gz
"

rm dist.tar.gz
