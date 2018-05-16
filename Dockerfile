FROM openjdk:8-jre

MAINTAINER blacktop, https://github.com/blacktop
MAINTAINER xonixx, https://github.com/xonixx

# Install ELK Required Dependancies
RUN set -x \
  && apt-get update \
  && apt-get -y install apt-transport-https \
  && wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
  && echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list \
  && apt-get update \
  && apt-get -y install \
        elasticsearch \
        kibana \
        logstash \
        supervisor \
        less \
        nano \
       # net-tools \
  && apt-get clean \
#  && apt-get autoclean \
  && apt-get autoremove \
#  && rm -rf /var/lib/apt/lists/*
&& rm -rf /tmp/* /var/tmp/*

COPY conf/logstash-log4j.conf /etc/logstash/conf.d/
COPY conf/supervisord.conf /etc/supervisor/conf.d/
COPY conf/scripts/configure.sh /scripts/configure.sh

VOLUME ["/etc/logstash/conf.d"]
VOLUME ["/etc/nginx"]

EXPOSE 5601 9200 9300 12345

CMD ["/usr/bin/supervisord"]
