# README

This is the repo for the Solidus Demo Site.

## Authentication

Currently, every request is assumed to have come from an admin user. (see `lib/spree/core/controller_helpers/auth_decorator.rb` for more info)

This allows access to the backend without the need to log in, allowing potential adopters to get a better look at what they'll be working with.

## Database Changes

Database changes are forbidden on the backend, to prevent shenanigans. Currently, an `ActiveRecord::RecordInvalid` error is thrown upon any kind of database change.
