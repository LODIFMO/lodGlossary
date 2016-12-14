require 'grape'
require 'warden'

require './lib/models/term' 

Warden::Strategies.add(:my_token) do
  def authenticate!
    token = env['HTTP_AUTH_TOKEN'] || env['rack.request.query_hash']['AUTH_TOKEN']
    if token == '7VmN06huIRQ8RcXgOvmTHqLG02W2Yz5k'
      success!(User.new)
    else
      throw :warden
    end
  end
end

class API < Grape::API
  format :json
  prefix :api

  use Warden::Manager do |manager|
    manager.default_strategies :my_token
    manager.failure_app = lambda {|env| [401,{}, ["Not authorized"]]}
  end

  get :terms do
    Term.all.map(&:to_json)
  end

  resource :admin do
    before do
      env['warden'].authenticate :my_token
    end
  end
end
