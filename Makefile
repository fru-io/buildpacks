SHELL=/bin/bash
PACK_FLAGS?=--no-pull
DDEV_REGISTRY?=$${DDEV_REGISTRY:-ddev}
PACK_CMD?=$(shell which pack)

all: stacks builders

.PHONY: stacks builders

stacks: stack-7.3 stack-7.2

stack-%:
	@echo "> Building '$*' stack..."
	./stacks/build-stack.sh stacks/$*

builders: builder-7.2 builder-7.3

builder-%:
	@echo "> Building PHP $* builder..."
	cat builders/$*.toml | \
		awk -F " |-" \
		'{u=1}/(run)|(build)-image = .*/{print($$1"-"$$2" "$$3" \"$(DDEV_REGISTRY)/php-stack-"$$1":$*\""); u=0}u' \
		> builders/.$*.toml
	$(PACK_CMD) create-builder $(DDEV_REGISTRY)/php-builder:$* --builder-config builders/.$*.toml $(PACK_FLAGS)

clean:
	rm -f ./out/*
	rm -r ./builders/.7.2.toml || true
	rm -r ./builders/.7.3.toml || true
	
	docker rmi $(DDEV_REGISTRY)/php-stack-base:7.2 || true
	docker rmi $(DDEV_REGISTRY)/php-stack-run:7.2 || true
	docker rmi $(DDEV_REGISTRY)/php-stack-build:7.2 || true
	
	docker rmi $(DDEV_REGISTRY)/php-stack-base:7.3 || true
	docker rmi $(DDEV_REGISTRY)/php-stack-run:7.3 || true
	docker rmi $(DDEV_REGISTRY)/php-stack-build:7.3 || true
	
	docker rmi $(DDEV_REGISTRY)/php-builder:7.2 || true
	docker rmi $(DDEV_REGISTRY)/php-builder:7.3 || true
