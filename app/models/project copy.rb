class Project
    include DataMapper::Resource

    property :id, Serial
    property :title, String, :required => true
    property :body, String
    property :screenshots, CommaSeparatedList
    # property :language_ids, CommaSeparatedList
    # property :library_ids, CommaSeparatedList
    # property :platform_ids, CommaSeparatedList
    
    property :created_at, DateTime
    property :created_on, Date
    property :updated_at, DateTime
    property :updated_on, Date

    # many :languages, :in => :language_ids
    # many :libraries, :in => :library_ids
    # many :platforms, :in => :platform_ids
    
    has n, :languages, :through => Resource
    has n, :libraries, :through => Resource
    has n, :platforms, :through => Resource
end
