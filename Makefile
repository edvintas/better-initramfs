all: bootstrap-all prepare image
	@echo '>>> All done.'
help:
	@scripts/meta help
image:
	@scripts/meta image
clean:
	@scripts/meta clean
prepare:
	@scripts/meta prepare
gen_sshd_keys:
	@scripts/meta gen_sshd_keys
release:
	@scripts/release
bootstrap-all:
	@bootstrap/bootstrap-all $(filter-out $@,$(MAKECMDGOALS))
enable-multiarch:
	@docker run --rm --privileged multiarch/qemu-user-static --reset -p yes && touch enable-multiarch
docker-build: enable-multiarch
	@docker build --platform linux/arm64/v8 -t bifs .
docker: docker-build
	@docker run -v `pwd`/output:/root/output --rm --privileged bifs
docker-shell: docker-build
	@docker run -v `pwd`/output:/root/output --rm --privileged -it bifs bash
