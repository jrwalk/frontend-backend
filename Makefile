lint:
	docker-compose run --rm fastapi-test /bin/bash -c "flake8 app/ && mypy app/ && black app/"

test:
	docker-compose run --rm fastapi-test python -m pytest test/

dev-shell:
	docker-compose run --rm fastapi-test /bin/bash

app-dev:
	docker-compose up app-dev

app-prod:
	docker-compose up -d app-prod
