#!/bin/bash
#
# Run the site locally using Jekyll Docker image (jekyll/jekyll).
# As you make changes to your blog, they will automatically be picked up the Jekyll process running in a docker container.

JEKYLL_VERSION='3.8.5'
PROJECT_DIR="$PWD/.."
CACHE_DIR="$PROJECT_DIR/vendor/bundle"
LOCAL_PORT=4000

docker container run \
--rm \
--volume="$PROJECT_DIR:/srv/jekyll" \
--volume="$CACHE_DIR:/usr/local/bundle" \
--publish="$LOCAL_PORT:4000" \
-it \
"jekyll/jekyll:$JEKYLL_VERSION" \
jekyll serve
