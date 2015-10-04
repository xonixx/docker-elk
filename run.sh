#!/usr/bin/env bash

sudo docker run -d --name elk -p 81:80 -p 9200:9200 -p 12345:12345 xonixx/elk