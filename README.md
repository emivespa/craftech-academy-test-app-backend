The compose is meant to be run together with test-app-frontend's like so:

	docker compose \
		-p test-app-compose \
		up 
	docker compose \
		-f ../test-app-frontend/docker-compose.yaml \
		-p test-app-compose \
		up 

(You may see orphaned container warnings.)

You'll also have to use the -p flag for `docker compose down`, you might want to
set `COMPOSE_PROJECT_NAME=test-app-compose` instead.

TODO: demasiado tumbero? reemplazar con metarepo.
