#!/bin/sh
echo "$DOCKER_PASS" | docker login -u $DOCKER_USER --password-stdin
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
REPO=$(echo "$TRAVIS_REPO_SLUG" | tr '[:upper:]' '[:lower:]')
docker build -f Dockerfile -t $REPO:$TAG .
docker push $REPO:$TAG