require 'mongoid'
require 'sparql/client'

# Model of technical terms
class Term
  include Mongoid::Document

  field :title, type: String # Title of term
  field :en_title, type: String # Eng title
  field :description, type: String # Description from @nazhukova
  field :dbpedia_description, type: String # Description from dbpedia
  field :dbpedia_uri, type: String # URI of dbpedia item

  def to_json
    {
      id: id.to_s,
      title: title,
      description: description,
      dbpedia_description: dbpedia_description,
      dbpedia_uri: dbpedia_uri,
      en_title: en_title
    }
  end

  # get rus text from rdfs:comment
  def upload_rus(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept rdfs:comment ?description .
          ?concept rdfs:label "#{en_title}"@en .
          FILTER ( lang(?description) = "ru" )
        }
      SPARQL
    )
  end

  # get rus text from dbo:abstract
  def upload_rus_mod(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept dbo:abstract ?description .
          ?concept rdfs:label "#{en_title}"@en .
          FILTER ( lang(?description) = "ru" )
        }
      SPARQL
    )
  end

  # get eng text from rdfs:comment
  def upload_eng(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept rdfs:comment ?description .
          ?concept rdfs:label "#{en_title}"@en .
          FILTER ( lang(?description) = "en" )
        }
      SPARQL
    )
  end

  # get eng text from dbo:abstract
  def upload_eng_mod(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept dbo:abstract ?description .
          ?concept rdfs:label "#{en_title}"@en .
          FILTER ( lang(?description) = "en" )
        }
      SPARQL
    )
  end

  def upload!
    sparql = SPARQL::Client.new("http://dbpedia.org/sparql")
    solution = upload_rus sparql
    solution = upload_rus_mod(sparql) if solution.blank? || solution.size < 1 || solution.first[:description].value.size < 50
    solution = upload_eng(sparql) if solution.blank? || solution.size < 1
    solution = upload_eng_mod(sparql) if solution.blank? || solution.size < 1 || solution.first[:description].value.size < 50
    return if solution.blank? || solution.size < 1
    self.dbpedia_uri = solution.first[:concept].value
    self.dbpedia_description = solution.first[:description].value
    self.save!
    self
  end
end
