class PlatformProject
  include DataMapper::Resource

  # property <name>, <type>
  property :project_id, Integer, :key => true
  property :platform_id, Integer, :key => true

  belongs_to :platform, :child_key => :platform_id
  belongs_to :project, :child_key => :project_id
end
