FROM ruby:2.6.2
RUN apt-get update && apt-get install -y --no-install-recommends curl libpq-dev git zip unzip

WORKDIR /app