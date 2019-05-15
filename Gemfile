source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.5.5'

gem 'rails', '~> 5.2.3'
gem 'actioncable'
gem 'puma'
gem 'pg', '~> 1.1.4'
gem 'redis'

gem 'mailgun-ruby', '~>1.1.4'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 5.0'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end

gem 'jquery-rails'
gem 'rails-timeago', '~> 2.0'
gem 'therubyracer'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'underscore-string-rails'
gem 'rails-backbone'
gem 'backbone-nested-attributes'

# Gretel breadcrumbs
gem 'gretel'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# Use slim templating engine
gem 'slim'

# Skim - Slim for client side templates
gem 'skim'

gem 'config'

gem 'cancancan', '1.16.0'
gem 'devise', '4.4.3'
gem 'devise-bootstrap-views'

gem 'redcarpet', '~> 3.0.0'

group :development do
# Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'jasmine'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
