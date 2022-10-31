.PHONY: default
default:
	# TODO: split into multiple recipes.
	# TODO: should not build if working Dockerfile doesn't match HEAD Dockerfile.
	docker build -t emivespa/test-app-backend:$$(git rev-parse --short HEAD) .
	docker tag  emivespa/test-app-backend:$$(git rev-parse --short HEAD)  emivespa/test-app-backend:latest .
	docker tag  emivespa/test-app-backend:$$(git rev-parse --short HEAD)  emivespa/test-app-backend:stable .
	docker push emivespa/test-app-backend:$$(git rev-parse --short HEAD)
	docker push emivespa/test-app-backend:latest
	docker push emivespa/test-app-backend:stable
