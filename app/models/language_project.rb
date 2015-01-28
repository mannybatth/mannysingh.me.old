class LanguageProject
  include DataMapper::Resource

  # property <name>, <type>
  property :project_id, Integer, :key => true
  property :language_id, Integer, :key => true

  belongs_to :language, :child_key => :language_id
  belongs_to :project, :child_key => :project_id
end
