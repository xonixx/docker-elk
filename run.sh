#!/usr/bin/env bash

mydir=$(dirname $0)
mydir=$(cd $mydir; pwd)

sudo docker run -d --name elk \
 -v $mydir/es_data:/usr/share/elasticsearch/data \
 -p 9200:9200 \
 -p 12345:12345 \
 -p 4560:4560 \
 -p 5601:5601 \
 -t \
 xonixx/elk