#!/usr/bin/env bash

mydir=$(dirname $0)
mydir=$(cd $mydir; pwd)

sudo docker run -d --net=host --name elk \
 -v $mydir/es_data:/usr/share/elasticsearch/data \
 -t \
 xonixx/elk