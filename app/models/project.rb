class Project
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :title, String, :required => true
  property :body, Text
  property :screenshots, Text
  property :list_order, Integer, :default => 0
  property :created_at, DateTime
  property :updated_at, DateTime
    
  has n, :languages, :through => Resource, :constraint => :skip
  has n, :libraries, :through => Resource, :constraint => :skip
  has n, :platforms, :through => Resource, :constraint => :skip

  before :destroy do |p|
    p.language_projects.destroy
    p.library_projects.destroy
    p.platform_projects.destroy
  end

end

