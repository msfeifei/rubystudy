# frozen_string_literal: true

source "https://rubygems.org"

gem 'dotenv-rails', groups: [:development, :test]
gem 'faraday'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

group :development, :test do
    gem 'rspec-rails'
end

%w[rspec rspec-core rspec-expectations rspec-mocks rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
