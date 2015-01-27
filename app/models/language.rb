class Language
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :link, String
  property :created_at, DateTime
  property :updated_at, DateTime
end
