#!/usr/bin/env bash

set -e

dl_into_current_dir() {
    wget https://github.com/xonixx/docker-elk/archive/master.zip
    unzip master.zip
    rm ./docker-elk-master/es_data/.store_elastic_data_here
    cp -r docker-elk-master/* .
    rm -r master.zip docker-elk-master
}

dl_into_current_dir