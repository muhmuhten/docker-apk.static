# apk.static: a minimum viable base image

This image provides the *absolute minimum* contents necessary to safely bootstrap a container to the point that it is not necessary to build a rootfs on the host to add to the container; i.e. it can be delegated to the package manager, Alpine Linux's apk. We include a static build of apk and signing keys for the Alpine repositories *only*; even busybox is excluded, which leaves no shell. This means that it's fairly difficult to run anything in this container, and a Dockerfile generally *must* use the exec form of RUN to install packages unless other executables are added. The recommended form is as follows:

    FROM vaca/apk.static
    RUN ["apk.static","--no-cache","--no-progress","add","--upgrade", \
        "alpine-baselayout", \
        "alpine-keys", \
        "musl-utils"]

Note that images built over will *generally not* be the smallest images possible for their purpose, and in fact the use of a static apk executable means derived images which otherwise use OpenSSL will generally be about 2M bigger than an equivalent image with dynamically linked apk.
