class LanguageProject
  include DataMapper::Resource

  # property <name>, <type>
  property :project_id, Integer, :key => true
  property :language_id, Integer, :key => true
end
