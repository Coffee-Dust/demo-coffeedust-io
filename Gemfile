# frozen_string_literal: true

source "https://rubygems.org"
repo_name = "demo-coffeedust-io"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "rack"
gem 'rack-cors', :require => 'rack/cors'
gem 'thin'
gem 'sinatra'

group :development do
  gem 'pry'
  gem 'shotgun'
end
