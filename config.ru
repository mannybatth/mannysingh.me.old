require 'sinatra/base'

Dir.glob(File.dirname(__FILE__) + '/app/{helpers}/*.rb').each { |file| require file }
require './app/controllers/base/base_controller.rb'
Dir.glob(File.dirname(__FILE__) + '/app/{models}/*.rb').each { |file| require file }
Dir.glob(File.dirname(__FILE__) + '/app/{controllers}/*.rb').each { |file| require file }

#config mongo connectivity
if ENV['MONGOHQ_URL']
    uri = URI.parse(ENV['MONGOHQ_URL'])
    MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
    MongoMapper.database = uri.path.gsub(/^\//, '')
else
    MongoMapper.connection = Mongo::Connection.new('localhost', nil)
    MongoMapper.database = "mannysingh_me"
end

map('/admin') { run AdminController }
map('/auth') { run AuthController }
map('/') { run IndexController }
