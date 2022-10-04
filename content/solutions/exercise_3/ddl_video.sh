#!/bin/bash
docker run \
    --rm -i \
    -e PGID=$(id -g) \
    -e PUID=$(id -u) \
    -v /workspace/exercise_3:/workdir:rw \
    mikenye/youtube-dl https://www.youtube.com/watch?v=psmZRfiXYnE