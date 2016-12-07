namespace :bundler do
  task :setup do
    require 'rubygems'
    require 'bundler/setup'
    require 'mongoid'
  end
end

task :environment, [:env] => 'bundler:setup' do |cmd, args|
  ENV['RACK_ENV'] = args[:env] || 'development'
  Mongoid.load!('mongoid.yml', ENV['RACK_ENV'])
  require './lib/models/term'
end

namespace :db do
  desc 'Add seeds'
  task :seeds do |cmd, args|
    env = args[:env] || 'development'

    Rake::Task['environment'].invoke(env)

    require 'yaml'

    thing = YAML.load_file('data/terms.yml')
    thing.each do |item|
      Term.create! title: item['title'], description: item['description'],
                   dbpedia_description: '', dbpedia_uri: '',
                   en_title: item['en_title']
    end
  end

  desc 'Remove all data'
  task :clear do |cmd, args|
    env = args[:env] || 'development'

    Rake::Task['environment'].invoke(env)
    Term.delete_all
  end

  desc 'Load DBpedia'
  task :dbpedia do |cmd, args|
    env = args[:env] || 'development'

    Rake::Task['environment'].invoke(env)
    require 'sparql/client'
    require 'byebug'
    sparql = SPARQL::Client.new("http://dbpedia.org/sparql")
    Term.all.each do |item|
      query = sparql.query(
        <<-SPARQL
          SELECT DISTINCT ?concept ?description
          WHERE {
            ?concept rdfs:comment ?description .
            ?concept rdfs:label "#{item.en_title}"@en .
            FILTER ( lang(?description) = "ru" )
          }
        SPARQL
      )
      next if query.blank? || query.size < 1
      item.dbpedia_uri = query.first[:concept].value
      item.dbpedia_description = query.first[:description].value
      item.save!
    end
  end
end
