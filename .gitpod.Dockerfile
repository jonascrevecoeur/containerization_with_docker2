FROM gitpod/workspace-full

# This env var is used to force the 
# rebuild of the Gitpod environment when needed
ENV TRIGGER_REBUILD 0

USER root

RUN apt-get update && \
    apt-get install -y wget git tree ssh nano sudo nmap man tmux curl && \
    apt-get clean && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    brew tap heroku/brew && \
    brew install heroku

# Copy exercices content into the image
COPY --chown=gitpod content/ /home/gitpod/docker-exercises

# Set up the exercices
# Set lock permissions for exercise 6
# Copy solutions of exercises in hidden spots
RUN mkdir /bin/abstergo && \
    mkdir /bin/piper && \
    mkdir /bin/blizzard && \
    mkdir /bin/acme && \
    mkdir /bin/glados && \
    mkdir /bin/dataminded && \
    mv /home/gitpod/docker-exercises/solutions/exercise_2 /bin/dataminded && \
    mv /home/gitpod/docker-exercises/solutions/exercise_3 /bin/acme && \
    mv /home/gitpod/docker-exercises/solutions/exercise_4 /bin/blizzard && \
    mv /home/gitpod/docker-exercises/solutions/exercise_5 /bin/piper && \
    mv /home/gitpod/docker-exercises/solutions/exercise_6 /bin/abstergo && \
    mv /home/gitpod/docker-exercises/solutions/exercise_8 /bin/glados && \
    rm -rf /home/gitpod/docker-exercises/solutions

USER gitpod