FROM solr:5
MAINTAINER M Parker "mparker17@536298.no-reply.drupal.org"

ENV SOLR_VERSION 5.x

# Create a core.
RUN bin/solr start && \
    bin/solr create_core -c collection1 && \
    bin/solr stop

# Copy the Drupal module's configuration into the core.
COPY search_api_solr/solr-conf/$SOLR_VERSION/* /opt/solr/server/solr/collection1/conf/
