#!/usr/bin/env bash

set -e

dl_into_current_dir() {
    if [[ -f "master.zip" ]]
    then
        rm master.zip
    fi

    if [[ -d "docker-elk-master" ]]
    then
      rm -rf docker-elk-master
    fi

    wget https://github.com/xonixx/docker-elk/archive/master.zip
    unzip master.zip
    rm -r ./docker-elk-master/es_data/
    cp -r docker-elk-master/* .
    rm -r master.zip docker-elk-master
}

dl_into_current_dir