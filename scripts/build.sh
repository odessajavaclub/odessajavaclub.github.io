#!/bin/bash
#
# Build the site using Jekyll Docker image (jekyll/jekyll).

JEKYLL_VERSION='3.8.5'
PROJECT_DIR="$PWD/.."
CACHE_DIR="$PROJECT_DIR/vendor/bundle"

docker container run \
--rm \
--volume="$PROJECT_DIR:/srv/jekyll" \
--volume="$CACHE_DIR:/usr/local/bundle" \
-it \
"jekyll/jekyll:$JEKYLL_VERSION" \
jekyll build
