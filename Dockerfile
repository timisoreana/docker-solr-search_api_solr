FROM makuk66/docker-solr:4.10.4
MAINTAINER M Parker "mparker17@536298.no-reply.drupal.org"

ENV SOLR_VERSION 4.x

COPY search_api_solr/solr-conf/$SOLR_VERSION/* /opt/$SOLR/example/solr/collection1/conf/
