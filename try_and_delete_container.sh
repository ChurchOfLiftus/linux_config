#!/usr/bin/bash
podman build . -t linux_config && podman run --rm -it -v .:/local_files/ linux_config
