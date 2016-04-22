# My simple blog

## Project description

This site allows you to write articles, comment them and search for
articles of other users

## Dependencies

* PostgreSQL 9.4.4
* Ruby 2.2.4
* Rails 4

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```

## Quick Start

```bash
# clone repo
git clone git@github.com:NeilAlishev/mySimpleBlog.git
cd mySimpleBlog

# run setup script
bin/setup

# configure ENV variables in .env
vim .env

# run server on 5000 port
bin/server
```

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

## Staging

* https://akmeapp-staging.herokuapp.com
