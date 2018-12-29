#!/usr/bin/env bash

dl_into_current_dir() {
    wget https://github.com/xonixx/docker-elk/archive/master.zip
    unzip master.zip
    mv docker-elk-master/* .
    rm -r master.zip docker-elk-master
}

dl_into_current_dir