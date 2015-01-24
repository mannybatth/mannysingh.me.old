class Language
  include MongoMapper::Document

  # key <name>, <type>
  key :name, String
  key :link, String
  timestamps!
end
