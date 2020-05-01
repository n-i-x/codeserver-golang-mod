# Golang - Docker mod for code-server

This mod adds a golang dev environment to code-server, to be installed/updated during container start.

This mod installs the latest available version of golang on container start. To install a specific version of golang set the `GO_VERSION` environment variable.

In code-server docker arguments, set an environment variable `DOCKER_MODS=nixapps/codeserver-golang:latest`

If adding multiple mods, enter them in an array separated by `|`, such as `DOCKER_MODS=nixapps/codeserver-golang:latest|linuxserver/mods:code-server-mod2`