# README

This is a pretty standard Rails app, assuming you've got Ruby 3.3 installed, setup is as simple as:

```
bundle install
bundle exec rails db:setup
cp .env.template .env
```

Edit `.env` with your Twilio credentials.

Then run `bin/dev` to start your server at https://localhost:3000

## Etc

This took, roughly 90 minutes coding all-in. I wanted to write RSpec tests, but the only thing that's not rote Rails here is Twilio. 😉
