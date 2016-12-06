require 'rubygems'
require 'sinatra'
require 'mongoid'

configure do
  Mongoid.load!('mongoid.yml', settings.environment)
end

set :root, 'lib/app'

get '/' do
  render :html, :index
end
