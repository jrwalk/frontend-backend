lint:
	docker-compose run --rm backend /bin/bash -c "flake8 app/ && mypy app/ && black app/"

test:
	docker-compose run --rm backend python -m pytest test/

dev-shell:
	docker-compose run --rm backend /bin/bash

start:
	docker-compose up -d

clean-untagged-images:
	docker rmi $$(docker images | grep '<none>' | awk '{print $$3}')
