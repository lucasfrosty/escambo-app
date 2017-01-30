source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# The safe Markdown parser, reloaded.
gem 'redcarpet'
# jQuery UI
gem 'jquery-ui-rails'
# Easy file attachment management for ActiveRecord
gem 'paperclip', '~> 5.0.0'
# Deals with money for us
gem 'money-rails'
# SB-Admin2 on Rails
gem 'bootstrap_sb_admin_base_v2'
# Translator for the devise gem
gem 'devise-i18n'
# Gem for enum with i18n
gem 'enum_help'
# Flexible authentication solution for Rails with Warden.
gem 'devise'
# Minimal authorization through OO design and pure Ruby classes
gem 'pundit'
# Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting
gem 'rails-i18n', '~> 5.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

source 'https://rails-assets.org' do
  # Markdown preview with JS
  gem 'rails-assets-marked'
  # Animated CSSgem 
  gem 'rails-assets-animate-css'
  # Confirm Notification
  gem 'rails-assets-bootbox'
  # Bootstrap Notify
  gem 'rails-assets-remarkable-bootstrap-notify'
  #Bootstrap gem v3.3.7
  gem 'rails-assets-bootstrap', '3.3.7'
  # Bootstrap Markdown
  gem 'rails-assets-bootstrap-markdown'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Gem to create Relational Database Graphics of the project
  gem 'rails-erd'
  # Better error page for Rack apps
  gem "better_errors"
  # Catches mail and serves it through a dream.
  gem 'mailcatcher'
  # Create fake data
  gem 'faker'
  # Fake data with Markdown
  gem 'doctor_ipsum'
  # Pry on Console
  gem 'pry-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
