require 'mongoid'

# Model of technical terms
class Term
  include Mongoid::Document
  field :title, type: String # Title of term
  field :description, type: String # Description from @nazhukova
  field :dbpedia_description, type: String # Description from dbpedia
  field :dbpedia_uri, type: String # URI of dbpedia item
end
