require 'grape'
require 'warden'
require 'grape_logging'
require 'byebug'

require './lib/models/term'
require './lib/models/user' 

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
  log_file = File.open('api.log', 'a')
  log_file.sync = true
  logger Logger.new GrapeLogging::MultiIO.new(STDOUT, log_file)
  logger.formatter = GrapeLogging::Formatters::Default.new
  use GrapeLogging::Middleware::RequestLogger, { logger: logger }

  format :json
  prefix :api

  use Warden::Manager do |manager|
    manager.default_strategies :my_token
    manager.failure_app = lambda {|env| [401,{}, ["Not authorized"]]}
  end

  get :terms do
    Term.all.map(&:to_json)
  end

  post :sign_in do
    if User.authenticate? params[:email], params[:password]
      {token: '7VmN06huIRQ8RcXgOvmTHqLG02W2Yz5k'}
    else
      {error: 404}
    end
  end

  resource :admin do
    before do
      env['warden'].authenticate :my_token
    end
  end
end
