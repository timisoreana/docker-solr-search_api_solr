# docker-solr-search_api_solr
Set up a Solr 4.x instance in Docker, automatically configured with search_api_solr's settings.

# Install

1. Clone the repository: `git clone --recursive git@github.com:mparker17/docker-solr-search_api_solr.git`
2. If you're using [Kitematic](https://kitematic.com/) 0.5.x or higher, go to `File` -> `Open Docker Command Line Terminal` and run the next command in the new terminal window, otherwise you'll get an error.
3. Build an image: `cd docker-solr-search_api_solr ; docker build -t solr-search_api_solr .`

# Usage

1. Start a container from the image: `docker run -P -d solr-search_api_solr`
2. Find the IP address and port for the Solr instance, so you can point Drupal's [search_api_solr module](https://www.drupal.org/project/search_api_solr) to it:
    * If you're using [Kitematic](https://kitematic.com/) 0.5.x or higher, you can find the IP address and port to point  to by clicking the container -> `Settings` -> `Ports` and looking at the `Mac Port` column. Note that clicking the link will (currently) bring you to a 404 page, because Kitematic doesn't know to add `/solr/` to the URL.
    * If you're using just the command-line, take note of the instance ID returned by **Usage Step #1** and run: `docker inspect --format='{{.NetworkSettings}}' $INSTANCE_ID`
3. When creating a server in the Search API module, set:
    * Solr host = The IP address of the container (e.g.: `192.168.99.100`)
    * Solr port = The port of the container (e.g.: `34567`)
    * Solr path = `/solr/collection1`

You can also access the Solr web interface by going to `http://ip:port/solr` (e.g.: `http://192.168.99.100:34567/solr/`).

# Notes

* Solr automatically sets up a collection for you named `collection1`. If you want, you can add new collections from the Solr web interface, but I recommend starting a new container for a different project (e.g.: follow the usage steps again). Multiple containers can run simultaneously, they just get different port numbers.
* If you delete a container, it's configuration and data will be deleted along with it! If using this on a production environment, make sure to set up Volumes and/or run containers to back up the data.
* If you restart your computer or Kitematic, the port assigned to a container might change. If this happens, Search API will complain that it can't connect to the Solr instance. You'll have to go into the Search API server settings and change the port that way, or use [the Search API Override module](https://www.drupal.org/project/search_api_override) to put the settings in settings[.local].php, to make them easier to change:

        // Search API Override module.
        $conf['search_api_override_mode'] = 'load';
        $conf['search_api_override_servers'][$server_machine_name]['options'] = array(
          'host' => '192.168.99.100',
          'port' => '34567',
          'path' => '/solr/collection1',
        );
