# docker-solr-search_api_solr
Set up a Solr 5.x instance in Docker, automatically configured with search_api_solr's settings.

### Installation
1. Clone the repository: `git clone --recursive https://github.com/alan-ps/docker-solr-search_api_solr`;
2. Go to docker-solr-search_api_solr repository and build an image: `sudo docker build -t solr-search_api_solr .`;
3. Start a container from the image: `sudo docker run -P -d solr-search_api_solr`;

### Usage
Solr will be available by the container's IP address. In order to get the IP address of a container, use the following command:

`sudo docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_ID`

**$CONTAINER_ID** can be gotten after execution this command: `sudo docker ps -a`. Then go to http://ip:port (e.g.: http://172.17.0.2:8983) and use Solr.

After performing the operations above, two solr cores will be created (d7_collection and d8_collection). They can be used for your drupal projects.

ref: https://github.com/mparker17/docker-solr-search_api_solr
buuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
