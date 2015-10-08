#!/usr/bin/env bash

mydir=$(dirname $0)
mydir=$(cd $mydir; pwd)

sudo docker run -d --name elk \
 -v $mydir/es_data:/usr/share/elasticsearch/data \
 -p 81:80 \
 -p 9200:9200 \
 -p 12345:12345 \
 xonixx/elk