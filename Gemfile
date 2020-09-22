source 'http://rubygems.org'

ruby "2.6.0"

gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake', '13.0.1'
gem 'require_all'
#gem 'sqlite3'#, '~> 1.3.13'
# gem 'sqlite3'
#gem 'pg'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'

# gem 'unicorn'
# gem 'truemail'
# gem 'dotenv'
# gem 'httparty'
gem 'sinatra-flash'

#gem 'rake', '13.0.1'

gem 'rack-ssl-enforcer'

#ruby '~> 2.6.0'

#gem "bigdecimal"#, ">= 2.0.0"
  gem 'shotgun'

group :development do

   gem 'sqlite3'
end

#gem 'sqlite3'
gem 'pg', '~> 0.15'
gem 'activerecord-postgresql-adapter'
#  group :production do
#    gem 'pg'
#    gem 'activerecord-postgresql-adapter'
#  end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
