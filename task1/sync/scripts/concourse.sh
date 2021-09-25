#!/usr/bin/env bash

rm -rf concourse || true
mkdir concourse
pushd concourse
    curl -O https://concourse-ci.org/docker-compose.yml
    sed -i 's/    ports: ["8080:8080"]/    ports: ["9000:8080"]/' docker-compose.yml
    docker-compose up -d
popd

pushd /usr/local/bin/
    curl -o fly "http://localhost:9000/api/v1/cli?arch=amd64&platform=linux"
    chmod 755 fly
popd

fly login --username test --password test
