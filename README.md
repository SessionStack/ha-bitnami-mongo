# HA Mongo with bitnami mongo images

This is a repo showing an example configuration (for docker compose and helm) to run a HA production mongo setup.

# docker-compose

Make sure you have `docker` and `docker-compose` installed.

Start with `./reset.sh`.

To test everything is working make sure you can connect with:

`docker-compose exec mongodb-primary mongo sessionstack -u sessionstack -p test`

`docker-compose exec mongodb-primary mongo admin -u root -p test`

`docker-compose exec mongodb-secondary mongo sessionstack -u sessionstack -p test`

`docker-compose exec mongodb-arbiter mongo sessionstack -u sessionstack -p test`
