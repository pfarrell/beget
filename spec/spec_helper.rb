require 'simplecov'
require 'test/unit'
require 'rack/test'
require 'logger'

require 'rubygems'
require 'bundler'

ENV['RACK_ENV'] = 'test'
Bundler.require ENV['RACK_ENV'].to_sym

SimpleCov.start do
  add_filter "/vendor/"
  add_filter "/spec/"
end

module RSpecMixin
  include Rack::Test::Methods
  def app() App end
end

#  $console = Logger.new STDOUT
#  database_url = "sqlite::memory:"
#  DB = Sequel.connect(database_url, logger: $console)
#  DB.sql_log_level = :debug
#  DB.extension(:pagination)
#  Sequel::Model.plugin :timestamps
#  Sequel::Model.plugin :json_serializer

#  require 'rake'
#  rake = Rake::Application.new
#  Rake.application = rake
#  rake.init
#  rake.load_rakefile
#  rake['db:migrate'].invoke
#  rake['import'].invoke


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  #config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
  config.profile_examples = 10
  config.order = :random

  Kernel.srand config.seed
  config.include RSpecMixin
end

require './app'
