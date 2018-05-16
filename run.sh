#!/usr/bin/env bash

mydir=$(dirname $0)
mydir=$(cd $mydir; pwd)

sudo docker run -d --net=host --name elk \
 -v $mydir/es_data:/var/lib/elasticsearch \
 -v $mydir/conf:/conf \
 -t \
 --init \
 xonixx/elk