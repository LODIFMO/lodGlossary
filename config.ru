require './lib/app'
require './lib/api'

Rack.Builder.new do
  use Rack::Session::Cookie, secret: '6KZ8I0a0279hvKC5I3u9v27r1Q41iTKb'
  
  use Warden::Manager do |manager|
    manager.default_strategies :password, :basic
    manager.failure_app = API
  end


  run Rack::Cascade.new [API, Web]
end
