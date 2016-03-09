#!/bin/sh
docker run --rm vaca/builder \
	-r "${1-`git symbolic-ref --short HEAD`}" \
	-p alpine-keys,apk-tools-static \
	| xz > rootfs.tar.xz
