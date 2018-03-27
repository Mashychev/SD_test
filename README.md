# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Generate Entity-Relationship Diagrams

* ## Install Graphviz

  `brew install graphviz`            Homebrew on Mac OS X

  `sudo port install graphviz`       Macports on Mac OS X

  `sudo apt-get install graphviz`    Debian and Ubuntu

* ## Generate diagram

  `bundle exec erd`


#### Installing Gems and prepare database
```bash
gem install bundler
bundle install
rake assets:precompile
```

##### Find your mysql.sock file

```bash mysqladmin variables | grep socket ```

#####Then, add a line to your config/database.yml

```
development:
  adapter: mysql2
  encoding: utf8
  username: root
  password: xxxx
  database: xxxx
  socket: your path to mysql.sock
```

```bash
rake db:create
rake db:migrate
rake db:seed
```

#### To start rails console:
```bash
rails c
```

#### To start web-server:
```bash
foreman start
```
