FROM postgres:15.3-bullseye

ENV PATH="$PATH:/usr/lib/postgresql/15/bin/"
# set work directory
WORKDIR /app/src

# install system dependencies
RUN apt-get update && apt-get install -y curl

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install heroku cli
RUN curl https://cli-assets.heroku.com/install.sh | sh

ENTRYPOINT ["tail", "-f", "/dev/null"]





