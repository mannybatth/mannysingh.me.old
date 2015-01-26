if ENV['MONGOLAB_URI']

    uri = URI.parse(ENV['MONGOLAB_URI'])
    MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOLAB_URI'])
    MongoMapper.database = uri.path.gsub(/^\//, '')
    MongoMapper.authenticate(uri.user, uri.password)

else

    MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)
    case Padrino.env
        when :development then MongoMapper.database = 'mannysingh_me_development'
        when :production  then MongoMapper.database = 'mannysingh_me_production'
        when :test        then MongoMapper.database = 'mannysingh_me_test'
    end

end
