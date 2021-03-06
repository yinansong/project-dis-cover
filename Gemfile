source 'https://rubygems.org'

ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'bootstrap-sass'

gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'jquery-ui-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'httparty'
gem 'actionview', '~> 4.1.5', require: "action_view"

gem 'activesupport', '~> 4.1.6'

gem 'paperclip'
gem 'aws-sdk'

gem 'newrelic_rpm'

gem 'validates_email_format_of'

gem 'country_select'

gem 'devise'

gem 'cancancan', '~> 1.10'

gem 'monologue'

gem 'jcrop-rails-v2', '~> 0.9.12.3'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'pry'
  gem 'pry-rails'
  gem 'shotgun'
  gem 'annotate'
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'launchy', '~> 2.4.2'
end

group :test do
  gem 'shoulda-matchers', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'rails_serve_static_assets'
end
