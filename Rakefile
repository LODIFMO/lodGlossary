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
  require './lib/models/user'
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
    User.delete_all
  end

  desc 'Load DBpedia'
  task :dbpedia do |cmd, args|
    env = args[:env] || 'development'

    Rake::Task['environment'].invoke(env)
    require 'sparql/client'
    Term.all.each do |item|
      item.upload!
    end
  end

  desc 'Create user'
  task :user do |cmd, args|
    env = args[:env] || 'development'

    Rake::Task['environment'].invoke(env)
    User.create! email: 'admin@admin.com', password: '12345678'
  end
end
