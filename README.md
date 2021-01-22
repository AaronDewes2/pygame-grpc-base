# python-grpc

This container makes it easier to use python-grpc in Docker. Because grpc contains a lot of native C code,
builds often take long, especially for arm64, which is often emulated through qemu.
This base container contains a prebuilt grpc for arm64, armv7 and amd64. In addition to saving you an hour of wait time,
this container is also optimized to be as small as possible. It is based on the python:3.7-slim image,
and because we optimized this image, unlike images with all build dependencies that are about 670MB in size,
this only has a size of 60MB-70MB.

This repository is also optimized to use a fork of grpc that uses arm64 assembler for boringSSL to make the image faster at runtime.
