




docker-run:
	sudo docker run -it --rm --shm-size=512M            \
		--runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all  \
		-v $(pwd)/results:/milabench/envs/runs          \
		ghcr.io/mila-iqia/milabench:cuda-v0.0.1         \
		milabench run --select resnet152


docker-pull-sha:
	sudo docker pull ghcr.io/mila-iqia/milabench@sha256:e70bf013c4e3be202bf42b9d6e532dff54c14ef10bc21bc9502ff9d288b59a40

docker-run-sha:
	sudo docker run -it --rm --shm-size=512M            \
		--runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=all  \
		-v $(pwd)/results:/milabench/envs/runs          \
		ghcr.io/mila-iqia/milabench@sha256:e70bf013c4e3be202bf42b9d6e532dff54c14ef10bc21bc9502ff9d288b59a40         \
		milabench run --select resnet152
