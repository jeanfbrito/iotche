#!/bin/bash

bundle check || bundle install --jobs $(nproc) --without test production
rm ./tmp/pids/server.pid

bundle exec rails s -p 80 -b 0.0.0.0
