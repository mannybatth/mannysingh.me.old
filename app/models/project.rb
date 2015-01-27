class Project
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :title, String
  property :body, Text
  property :screenshots, String
  property :created_at, DateTime
  property :updated_at, DateTime
    
  has n, :languages, :through => Resource, :constraint => :destroy
  has n, :libraries, :through => Resource, :constraint => :destroy
  has n, :platforms, :through => Resource, :constraint => :destroy

end

