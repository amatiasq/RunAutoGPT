run:
	./run.sh $(name)

build:
	docker build -t autogpt:latest .
