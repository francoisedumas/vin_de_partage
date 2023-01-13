# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "cloudinary"
gem "devise_invitable"
gem "devise-i18n"
gem "devise"
gem "geocoder"
gem "image_processing", "~> 1.2"
gem "importmap-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4"
gem "redis", "~> 4.5"
gem "sidekiq-failures", "~> 1.0"
gem "sidekiq", "~> 6.5"
gem "simple_form", github: "heartcombo/simple_form"
gem "slim-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "view_component"

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

gem "rails-i18n", "~> 7.0.0"
gem "enumerize"

group :development, :test do
  gem "bullet"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rubocop-rails", require: false
end

group :test do
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end
