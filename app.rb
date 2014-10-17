$: << File.expand_path('../app', __FILE__)

Bundler.require :default, ENV['RACK_ENV'].to_sym
require 'logger'

class App < Sinatra::Application
  helpers Sinatra::UrlForHelper
  helpers Sinatra::Cookies
  register Sinatra::RespondTo

  enable :sessions
  set :session_secret, ENV["BEGET_SESSION_SECRET"] || "youshouldreallychangethis"
  set :views, Proc.new { File.join(root, "app/views") }

  $console = Logger.new STDOUT
  database_url = ENV["BEGET_DATABASE_URL"] || 'sqlite://photogumbo.db'
  DB = Sequel.connect(
    database_url,
    logger: $console)
  DB.sql_log_level = :debug
  DB.extension(:pagination)
  Sequel::Model.plugin :timestamps
  Sequel::Model.plugin :json_serializer


  before do
    response.set_cookie(:appc, value: SecureRandom.uuid, expires: Time.now + 3600 * 24 * 365 * 10) if request.cookies["bmc"].nil?
  end
end

require 'models'
require 'routes'
