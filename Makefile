.PHONY: docker docs

docker:
	docker build . -t fiber-test

docker-pytorch:
	docker build . -f fiber-pytorch.docker -t fiber-pytorch

test: docker
	./test.sh

ltest:
	./test_local.sh

ktest:
	./test_kubernetes.sh

cov:
	pytest --cov-report html --cov-report annotate --cov=fiber tests

lint:
	flake8 fiber

style:
	isort fiber/*.py

docs:
	cd mkdocs && pydocmd build -d ../docs

serve:
	cd mkdocs && pydocmd serve --livereload