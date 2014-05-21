source 'https://rubygems.org'
ruby '2.1.1'
#ruby-gemset=pinfinity

gem 'rails', '4.1.1'
gem 'bootstrap-sass'
gem 'sprockets'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'childprocess'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'libnotify'
  gem 'factory_girl_rails'
end

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'will_paginate'
gem 'mathjax-rails'
gem 'spring',        group: :development

#Authentication using devise
gem 'devise'

group :doc do
gem 'sdoc', '~> 0.4.0', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
