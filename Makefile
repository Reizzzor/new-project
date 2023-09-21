DOCKER_COMPOSE_EXT=docker-compose -f "docker-compose.yml" -f "docker-compose.ext.yml"

RUN_APP_KEY_COMMAND=docker-compose run --rm php-fpm php artisan key:generate
VERIFY_APP_KEY_COMMAND=if [ "$$(grep 'APP_KEY=' .env)" = "APP_KEY=" ]; then $(RUN_APP_KEY_COMMAND); fi

RUN_JWT_SECRET_COMMAND=docker-compose run --rm php-fpm php artisan jwt:secret
VERIFY_JWT_SECRET_COMMAND=if [ "$$(grep 'JWT_SECRET=' .env)" = "JWT_SECRET=" ]; then $(RUN_JWT_SECRET_COMMAND) -f; fi

install:
	docker build -t new_project .
	docker run -d --name new_project new_project
	docker exec new_project composer create-project laravel/laravel /new_project
	docker cp new_project:/new_project .
	mv ./new_project/* ./
	rm -R new_project
	docker stop new_project
	docker rm new_project
	docker rmi new_project
	cp contrib/* ./
	rm contrib



#install:
#	-cp -n .env.example .env
#	if [ -n "$(GITHUB_API_TOKEN)" ]; then \
#		sed -i -e 's/GITHUB_API_TOKEN=.*/GITHUB_API_TOKEN="$(GITHUB_API_TOKEN)"/g' .env; \
#	fi

env-testing:
	-cat .env.example .env.testing.extra > .env.testing

app-key:
	$(RUN_APP_KEY_COMMAND)
