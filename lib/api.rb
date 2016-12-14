require 'grape'

require './lib/models/term' 

class API < Grape::API
  format :json
  prefix :api

  get :terms do
    Term.all.map(&:to_json)
  end
end
