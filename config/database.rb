MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'mannysingh_me_development'
  when :production  then MongoMapper.database = 'mannysingh_me_production'
  when :test        then MongoMapper.database = 'mannysingh_me_test'
end
