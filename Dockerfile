# We need to specify the BASE image (core) that we gonna run inside the VM
# If you want to create your own core image, read this
# https://docs.docker.com/develop/develop-images/baseimages/

FROM ruby:2.6.3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install Rails dependencies for the OS
RUN apt-get update && apt-get install -y libpq-dev postgresql-client nodejs yarn --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV BUNDLE_PATH /bundler_cache
ENV GEM_PATH /bundler_cache
ENV GEM_HOME /bundler_cache

# Set the work directory inside container
RUN mkdir /app
WORKDIR /app

RUN echo "gem: --no-document" >> ~/.gemrc

# Copy the Gemfile inside the container
COPY Gemfile* /app/

# Install the Gems
RUN gem install bundler
RUN bundle install --jobs 32 --retry 4

# Copy all the rest inside work directory
COPY . /app
