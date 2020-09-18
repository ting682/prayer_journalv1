ENV['SINATRA_ENV'] ||= "production"

require 'bundler/setup'
require 'rack/ssl-enforcer'

Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
#   ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

#db = URI.parse(ENV['HEROKU_POSTGRESQL_COBALT_URL'] || 'postgres://localhost/')

# ActiveRecord::Base.establish_connection(
#   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#   :host     => db.host,
#   :username => db.user,
#   :password => db.password,
#   :database => db.path[1..-1],
#   :encoding => 'utf8'
# )

ActiveRecord::Base.establish_connection(
    {:adapter => 'postgresql',
     :database => 'prayerjournal',
     :host => 'localhost',
     :port => '5432',
     :username => 'postgres',
     :password => ENV['LOCAL_DATABASE_PASSWORD'],
     :encoding => 'utf8'}
)

end



configure :production do

  set :force_ssl, true

  db = URI.parse(ENV['DATABASE_URL'])

   ActiveRecord::Base.establish_connection(
     :adapter  => 'postgresql',
     :host     => db.host,
     :username => db.user,
     :password => db.password,
     :database => db.path[1..-1],
     :encoding => 'utf8'
   )
end

require './app/controllers/application_controller'
require_all 'app'
# require 'truemail'
require 'securerandom'
require 'time'
# require 'dotenv/load'
# require 'httparty'
require 'pry'