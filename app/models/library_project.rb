class LibraryProject
  include DataMapper::Resource

  # property <name>, <type>
  property :project_id, Integer, :key => true
  property :library_id, Integer, :key => true

  belongs_to :library, :child_key => :library_id
  belongs_to :project, :child_key => :project_id
end
