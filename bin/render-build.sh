#!/usr/bin/env bash
# exit on error
set -o errexit

# Install gems
bundle install

# Precompile assets
bundle exec rake assets:precompile

# Clean old assets
bundle exec rake assets:clean

# Reset the database (drop, create, migrate)
bundle exec rake db:drop db:create db:migrate

# Load seed data
bundle exec rake db:seed