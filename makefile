
args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-}`


migrate:
	docker exec php-fpm php artisan migrate

migrate_fresh:
	docker exec php-fpm php artisan migrate:fresh

create_model:
	docker exec php-fpm php artisan make:model $(call args)

create_migrate:
	docker exec php-fpm php artisan make:migration $(call args)

create_api_model_migration_controller:
	docker exec php-fpm php artisan make:model $(call args) --api -m

artisan_help:
	docker exec php-fpm php artisan

docker_stop:
	docker-compose -f "docker-compose.yml" -p "primetechpassmanager" stop

docker_start_demon:
	docker-compose -f "docker-compose.yml" -p "primetechpassmanager" start
