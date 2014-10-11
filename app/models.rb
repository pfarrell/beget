require 'sequel'
require 'redis'
require 'logger'
  
$console = Logger.new STDOUT
DB = Sequel.connect(
  "mysql2://#{ENV["BEMUSED_DB_USER"]}:#{ENV["BEMUSED_DB_PASS"]}@#{ENV["BEMUSED_DB_HOST"]}/#{ENV["BEMUSED_DB_NAME"]}",
  logger: $console)
DB.sql_log_level = :debug
DB.extension(:pagination)

Sequel::Model.plugin :timestamps
Sequel::Model.plugin :json_serializer

