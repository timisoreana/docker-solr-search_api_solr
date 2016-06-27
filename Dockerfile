FROM solr:5

ENV SOLR_VERSION 5.x
ENV SOLR_CORE_NAME_D7 d7_collection
ENV SOLR_CORE_NAME_D8 d8_collection

# Create the cores for d7 and d8 projects.
RUN bin/solr start && \
    bin/solr create_core -c $SOLR_CORE_NAME_D7 && \
    bin/solr create_core -c $SOLR_CORE_NAME_D8 && \
    bin/solr stop

# Copy the Drupal module's configuration into the core.
COPY d7/search_api_solr/solr-conf/$SOLR_VERSION/* /opt/solr/server/solr/$SOLR_CORE_NAME_D7/conf/
COPY d8/search_api_solr/solr-conf/$SOLR_VERSION/* /opt/solr/server/solr/$SOLR_CORE_NAME_D8/conf/
