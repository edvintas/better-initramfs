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
docker:
	@docker build -t bifs .
	@docker run -v `pwd`/output:/output --rm -it bifs
