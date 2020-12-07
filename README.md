# Spacebook

Makers group project exploring Rails. Created in a group with <a href="https://github.com/edcourage">Ed</a>, <a href="https://github.com/SHUBV92">Shubs</a>, <a href="https://github.com/SevenSecrets">Freddie</a>, <a href="https://github.com/amybalmforth">Amy</a> & <a href="https://github.com/sarar0">Sara</a>.

## Setup

```bash
> git clone https://github.com/CodeKrakken/spacebook
> bundle install
> bin/rails db:create
> bin/rails db:migrate
> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Features

* Visitors can sign up for a new account, or sign in with an existing one
* Users can post and read existing posts
* Users can like or comment on posts
* Users can unlike posts if they have already liked them
* Posts display name of poster, time and date of posting, number of likes and all comments
* Stretch - we planned to add liking comments, deleting posts and comments, and adding friends. It is a social network after all!

## Visit

Hosted [here](https://spaciest-of-books.herokuapp.com/). The server takes a while to get going, so please be patient.

## Status

*Travis CI build status (master):*

[![Build Status](https://travis-ci.org/SevenSecrets/acebook-rails-template.svg?branch=master)](https://travis-ci.org/SevenSecrets/acebook-rails-template)
