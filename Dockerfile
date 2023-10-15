ARG RUNTIME_BASE_REGISTRY=docker.io
ARG RUNTIME_BASE_IMAGE=library/ubuntu
ARG RUNTIME_BASE_TAG=latest
ARG BRANCH=main

FROM ${RUNTIME_BASE_REGISTRY}/${RUNTIME_BASE_IMAGE}:${RUNTIME_BASE_TAG} AS runtime
COPY ./*.sh /bvkt/
COPY ./dotfiles /bvkt/dotfiles
ARG USER=root

RUN apt update;\
    apt upgrade -y;\
    apt install -y iproute2 neofetch cowsay nmap iputils-ping dnsutils locales;\
    apt install -y locales-all;\
    locale-gen en_US.UTF-8;\
    cd /bvkt;\
    bash -c ./setup.sh

ENTRYPOINT zsh
