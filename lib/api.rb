require 'grape'

require './lib/models/term' 

class API < Grape::API
  format :json
  prefix :api

  Warden::Manager.serialize_into_session do |user|
    user.id
  end

  Warden::Manager.serialize_from_session do |id|
    User.get(id)
  end

  get :terms do
    Term.all.map(&:to_json)
  end

  post :login do
    env['warden'].authenticate! :password
  end
end
