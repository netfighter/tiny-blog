# Tiny Blog [![Build Status](https://travis-ci.org/netfighter/tiny-blog.svg?branch=master)](https://travis-ci.org/netfighter/tiny-blog)
A simple blog system built with Ruby on Rails 4.2.5, Twitter Bootstrap and Slim templating engine

## Installation steps

1. Run the bundle installer:

        bundle install

2. Edit the database configuration file: config/database.yml

3. Run the database migrations:

        bundle exec rake db:migrate

4. Run the database seeds, which will create a user and some basic access roles:

        bundle exec rake db:seed

5. In your web browser of choice, go to `http://localhost:3000`. You can sign in using the credentials:

        email: admin@admin.com
        password: administrator
        
6. You can use the Backbone.js implementation by changing one setting in `config/settings.yml`

        use_mvc: yes
