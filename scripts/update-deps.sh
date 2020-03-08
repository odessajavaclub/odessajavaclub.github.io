#!/bin/bash
#
# Update Jekyll dependencies using Jekyll Docker image (jekyll/jekyll).
# This script updates Gemfile.lock using the provided Gemfile.

JEKYLL_VERSION='3.8.5'
PROJECT_DIR="$PWD/.."
CACHE_DIR="$PROJECT_DIR/vendor/bundle"

docker container run \
--rm \
--volume="$PROJECT_DIR:/srv/jekyll" \
--volume="$CACHE_DIR:/usr/local/bundle" \
-it \
"jekyll/jekyll:$JEKYLL_VERSION" \
bundle update
