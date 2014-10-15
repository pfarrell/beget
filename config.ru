require 'rubygems'

require 'bundler'
ENV['RACK_ENV'] ||= "development"
Bundler.require :default, ENV['RACK_ENV'].to_sym

root = ::File.dirname(__FILE__)
require ::File.join( root, 'app' )

run App.new
