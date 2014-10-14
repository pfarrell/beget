require 'sequel'
require 'logger'
  
$console = Logger.new STDOUT
database_url = ENV["DATABASE_URL"] || 'postgres://localhost/quakes')
DB = Sequel.connect(
  database_url,
  logger: $console)
DB.sql_log_level = :debug
DB.extension(:pagination)

Sequel::Model.plugin :timestamps
Sequel::Model.plugin :json_serializer

require 'models/page'
