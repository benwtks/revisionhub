source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc2', '< 5.1'
# Use mysql as the database for Active Record
# gem 'mysql2', '~> 0.3.18'
# Use psql as the database for Active Record
gem 'pg', '~> 0.18.4'
# Use puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0', '>= 5.0.5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

# Pages for infinite scrolling
gem 'will_paginate', '~> 3.1.0'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'brakeman'
end

gem 'rails_12factor', group: :production

gem 'haml', git: 'https://github.com/haml/haml'
# gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem 'simple_form'
gem "devise", ">= 4.7.1"

# required to fix temp issue with certain gems (such as sass-rails)
gem 'sprockets', '~> 3.5', '>= 3.5.2'

# For natural language
gem 'to_words'

# Chronic gem for referencing times
gem 'chronic', '~> 0.10.2'

# make the app boot faster
gem 'bootsnap', require: false

# For email
gem 'mailgun-ruby', '~> 1.1', require: true
gem 'premailer-rails'
