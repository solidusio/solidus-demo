# README

This is the repo for the Solidus Demo Site.

## Authentication

Currently, every request is assumed to have come from an admin user. (see `lib/spree/core/controller_helpers/auth_decorator.rb` for more info)

This allows access to the backend without the need to log in, allowing potential adopters to get a better look at what they'll be working with.

## Deploying

demo.solidus.io auto-deploys (on Heroku) from the master branch of this repository - a few minutes after your PR is merged, you should see it reflected on the website.
