source "https://rubygems.org"

gem 'rake'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'emk-sinatra-url-for', require: 'sinatra/url_for'
gem 'sinatra-respond_to', require: 'sinatra/respond_to'
gem 'sequel'

gem 'haml'

gem 'capistrano', '~> 3.2.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-bower'

group :production do
  gem 'mysql2'
end

group :test do
  gem 'rack-test', :require => "rack/test"
end

group :development, :test do
  gem 'rspec'
  gem 'simplecov'
  gem 'byebug'
  gem 'shotgun'
  gem 'sqlite3'
end
