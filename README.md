# README

This is the repo for the Solidus Demo Site.

## Authentication

Currently, every request is assumed to have come from an admin user. (see `lib/spree/core/controller_helpers/auth_decorator.rb` for more info)

This allows access to the backend without the need to log in, allowing potential adopters to get a better look at what they'll be working with.

## Database Changes

Database changes are forbidden on the backend, to prevent shenanigans. Currently, an `ActiveRecord::RecordInvalid` error is thrown upon any kind of database change.

## Info Panel

The application contains an info panel on every page (bottom right) containing information about the page they are currently on, and helpful buttons for navigating the website.

Page information is stored in `lib/panel.yml`. This data is loaded on server start, so you'll need to restart your server to see any changes. Text is currently stored first by section (frontend or backend), then by controller name (`orders` or `products`), then by action name (`show` or `index`). We may want to increase the granularity here depending on our needs going forward.
