#!/bin/sh
docker run --rm vaca/builder -p alpine-keys,apk-tools-static | xz > rootfs.tar.xz
