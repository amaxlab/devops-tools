#!/bin/bash

set -e

if [[ ! "$DEVOPS_PRIVATE_KEY_BASE64" == "" ]]; then
	echo $DEVOPS_PRIVATE_KEY_BASE64 | base64 -d > /root/.ssh/id_rsa
	chmod 600 /root/.ssh/id_rsa
fi;

if [[ ! "$SSH_KEY_SCAN" == "" ]]; then
    echo "" > ~/.ssh/known_hosts
    for host in "$SSH_KEY_SCAN"; do
	ssh-keyscan -t rsa $host >> ~/.ssh/known_hosts
    done;
fi;

git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"

exec "$@"
