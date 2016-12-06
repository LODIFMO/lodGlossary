require 'rubygems'
require 'sinatra'
require 'mongoid'

configure do
  Mongoid.load!('mongoid.yml', settings.environment)
end

get '/' do
  slim :'index'
end
