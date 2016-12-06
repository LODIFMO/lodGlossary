require 'mongoid'

# Model of technical terms
class Term
  include Mongoid::Document
  field :title, type: String # Title of term
  field :description, type: String # Description from @nazhukova
  field :dbpedia_description, type: String # Description from dbpedia
  field :dbpedia_uri, type: String # URI of dbpedia item

  def to_json
    {
      id: id.to_s,
      title: title,
      description: description,
      dbpedia_description: dbpedia_description,
      dbpedia_uri: dbpedia_uri
    }
  end
end
