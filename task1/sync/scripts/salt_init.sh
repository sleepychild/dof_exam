#!/usr/bin/env bash

# "${1}" is '*'
# "${2}" is 'main'

sleep 1m # Wait for the machine to come up

sudo salt '*' state.apply # top.sls on all

sudo salt '*' state.apply 07_docker_install

sudo salt '*' state.apply 07_docker_start

sudo salt 'main' state.apply 09_terraform_install

sudo salt 'main' state.apply 99_run_deploy
