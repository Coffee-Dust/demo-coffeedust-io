# frozen_string_literal: true

source "https://rubygems.org"
repo_name = "demo-coffeedust-io"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "rack"
gem 'rack-cors', :require => 'rack/cors'
gem 'rack-contrib', git: 'git@github.com:rack/rack-contrib', :require => 'rack/contrib'
gem 'thin'
gem 'sinatra'
gem 'require_all'

group :development do
  gem 'pry'
  gem 'shotgun'
end
