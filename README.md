![elk-logo](https://raw.githubusercontent.com/xonixx/docker-elk/master/elk-logo.png)

ELK for log4j
=============

[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

This repository contains a **Dockerfile** of [ELK](http://www.elasticsearch.org/overview/elkdownloads/) stack.

This repo is fork of [blacktop/docker-elk](https://github.com/blacktop/docker-elk) targeted to collect log4j logs via socket appender.

Fetch latest files to (re-)build docker container: 
```
curl -sSL https://raw.githubusercontent.com/xonixx/docker-elk/master/dl.sh?$(date +"%T") | bash
```