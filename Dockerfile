FROM openjdk:8-jre

MAINTAINER blacktop, https://github.com/blacktop
MAINTAINER xonixx, https://github.com/xonixx

ENV KIBANA_VERSION 4.3.1-linux-x64

# Install ELK Required Dependancies
RUN set -x \
  && apt-get update \
  && apt-get -y install wget --no-install-recommends \
  && wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - \
  && echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" >> /etc/apt/sources.list \
  && echo "deb http://packages.elasticsearch.org/logstash/2.1/debian stable main" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get -y install elasticsearch \
        supervisor \
        logstash \
        less \
        nano \
       # net-tools \
#  && apt-get purge -y --auto-remove wget \
#  && apt-get clean \
#  && apt-get autoclean \
#  && apt-get autoremove \
#  && rm -rf /var/lib/apt/lists/*
&& rm -rf /tmp/* /var/tmp/*

# Install Kibana
ADD https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz /opt/
COPY conf/logstash-log4j.conf /etc/logstash/conf.d/

# Configure Kibana
RUN cd /opt \
  && echo "Installing Kibana $KIBANA_VERSION..." \
  && tar xzf kibana-$KIBANA_VERSION.tar.gz \
  && ln -s /opt/kibana-$KIBANA_VERSION /opt/kibana \
  && rm kibana-$KIBANA_VERSION.tar.gz

COPY conf/supervisord.conf /etc/supervisor/conf.d/
COPY conf/scripts/configure.sh /scripts/configure.sh

VOLUME ["/etc/logstash/conf.d"]
VOLUME ["/etc/nginx"]

EXPOSE 5601 9200 9300 12345

CMD ["/usr/bin/supervisord"]
