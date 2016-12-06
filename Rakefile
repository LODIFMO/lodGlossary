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
    Term.create! title: 'title', description: 'description',
                 dbpedia_description: 'dbpedia', dbpedia_uri: '12'
  end
end
