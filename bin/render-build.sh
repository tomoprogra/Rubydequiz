#!/usr/bin/env bash
# exit on error
set -o errexit

# Install gems
bundle install

# Precompile assets
bundle exec rake assets:precompile

# Clean old assets
bundle exec rake assets:clean