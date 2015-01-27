class LibraryProject
  include DataMapper::Resource

  # property <name>, <type>
  property :project_id, Integer, :key => true
  property :library_id, Integer, :key => true
end
