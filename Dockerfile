FROM makuk66/docker-oracle-java7
MAINTAINER M Parker "mparker17@536298.no-reply.drupal.org"

ENV SOLR_VERSION 4.10.3
ENV SOLR solr-$SOLR_VERSION
RUN export DEBIAN_FRONTEND=noninteractive && \
apt-get update && \
apt-get -y install lsof curl procps && \
mkdir -p /opt && \
wget -nv --output-document=/opt/$SOLR.tgz http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
tar -C /opt --extract --file /opt/$SOLR.tgz && \
rm /opt/$SOLR.tgz && \
ln -s /opt/$SOLR /opt/solr
EXPOSE 8983
CMD ["/bin/bash", "-c", "/opt/solr/bin/solr -f"]

ENV SOLR_VERSION 4.x

COPY search_api_solr/solr-conf/$SOLR_VERSION/* /opt/$SOLR/example/solr/collection1/conf/
