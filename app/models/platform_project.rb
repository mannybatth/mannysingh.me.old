class PlatformProject
  include DataMapper::Resource

  # property <name>, <type>
  property :project_id, Integer, :key => true
  property :platform_id, Integer, :key => true
end
