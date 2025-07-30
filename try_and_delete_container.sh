#!/usr/bin/bash
podman build . -t linux_config && podman run --rm -it linux_config
