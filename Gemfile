# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "cloudinary"
gem "image_processing", "~> 1.2"
gem "importmap-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4"
gem "redis", "~> 4.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

gem "rails-i18n", "~> 7.0.0"
gem "enumerize"

group :development, :test do
  gem "pry-byebug"
  gem "pry-rails"
end

group :development, :test do
  gem "rubocop-rails", require: false
end

gem "slim-rails"
gem "simple_form", github: "heartcombo/simple_form"
gem "sidekiq"
gem "sidekiq-failures", "~> 1.0"
gem "devise"
gem "devise-i18n"
gem "devise_invitable"
gem "view_component"
