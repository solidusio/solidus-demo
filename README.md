# README

This is the repo for the Solidus Demo Site.

## Running locally

After cloning the repo, `cd` into the folder and run the following commands:

```
bundle install
yarn install
rails db:create db:migrate db:seed
```

The app runs at http://localhost:3000. The admin interface can be accessed at http://localhost:3000/admin/.

## Authentication

Currently, every request is assumed to have come from an admin user. (see `lib/spree/core/controller_helpers/auth_decorator.rb` for more info)

This allows access to the backend without the need to log in, allowing potential adopters to get a better look at what they'll be working with.

## Deploying

demo.solidus.io auto-deploys (on Heroku) from the master branch of this repository - a few minutes after your PR is merged, you should see it reflected on the website.

## Database Changes

This demo relies on the existence of a `sample_indicator_id` for every table in the database (except two - [see more here.](https://github.com/nebulab/solidus-demo/blob/a727c82d0e69bd1b901e10f9eb6a5bbae482b5cd/db/migrate/20200529174800_add_sample_indicator_id_to_everything.rb))

When adding new tables to the database, please make sure to also include a `sample_indicator_id` string, otherwise the demo might break.
