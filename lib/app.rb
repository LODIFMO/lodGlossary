require 'rubygems'
require 'sinatra'
require 'sinatra/json'
require 'mongoid'

require './lib/models/term'

configure do
  Mongoid.load!('mongoid.yml', settings.environment)
end

set :root, 'lib/app'

get '/' do
  render :html, :index
end

get '/terms.json' do
  terms = Term.all
  json terms.map(&:to_json)
end

post '/terms.json' do
  term = Term.new params[:term]
  term.save!
  json term.to_json
end
