FROM openjdk:8-jre

MAINTAINER xonixx, https://github.com/xonixx

# Install ELK Required Dependancies
RUN set -x \
  && echo "Trigger update to 6.5.4" \
  && apt-get update \
  && apt-get -y install apt-transport-https \
  && wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
  && echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list \
  && apt-get update \
  && apt-get -y install \
        elasticsearch \
        kibana=6.4.3 \
        logstash \
        supervisor \
        procps \
        less \
        nano \
       # net-tools \
  && apt-get clean \
#  && apt-get autoclean \
  && apt-get autoremove \
#  && rm -rf /var/lib/apt/lists/*
&& rm -rf /tmp/* /var/tmp/*

EXPOSE 5601 9200 9300 4560

CMD ["/usr/bin/supervisord", "-c", "/conf/supervisord.conf"]
