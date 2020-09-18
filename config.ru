require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# require 'dotenv/load'


use Rack::SslEnforcer if production?

use Rack::MethodOverride
use UsersController
use Rack::MethodOverride
use WallprayersController
use Rack::MethodOverride
use JournalentriesController
run ApplicationController
