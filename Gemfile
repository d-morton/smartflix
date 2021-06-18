source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'faker', '~> 2.18.0'
gem 'faraday', '~> 1.4.2'
gem 'jbuilder', '~> 2.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'sidekiq', '~>6.0.2'
gem 'tzinfo-data', '~> 1.2021.1', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.4.0'

group :development, :test do
  gem 'factory_bot', '~> 6.2.0'
  gem 'pry-byebug', '~> 3.9.0'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'vcr', '~> 6.0.0'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop', '~> 1.17.0', require: false
  gem 'rubocop-performance', '~> 1.11.3', require: false
  gem 'rubocop-rails', '~> 2.0.1', require: false
  gem 'rubocop-rspec', '~> 2.2.0', require: false
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner-active_record','~> 2.0.1'
  gem 'selenium-webdriver', '~> 3.142.7'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'webdrivers', '~> 4.6.0'
  gem 'webmock', '~> 3.13.0'
end
