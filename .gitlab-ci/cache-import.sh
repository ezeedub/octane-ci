#!/usr/bin/env bash
# Script used in GitLab CI to import cache from build.
# This runs within the Dockerfile.web image in GitLab.
# Run via: docker run --rm -v ${PWD}:/build IMAGENAME /build/.gitlab-ci/cache-import.sh

cd /var/www

ls -al
ls -al /build

# /build is the local host files directory.
# Copy any files needed from the container into /build.
# For example, vendor, node_modules, etc.
cp -R vendor /build

# Only copy cached composer.lock if project doesn't already have one in repo.
if [ ! -f /build/composer.lock ]; then
  cp composer.lock /build
fi