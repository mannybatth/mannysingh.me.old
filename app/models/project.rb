class Project
    include MongoMapper::Document

    # key <name>, <type>
    key :title, String, :required => true
    key :body, String
    key :screenshots, String
    key :language_ids, Array
    key :library_ids, Array
    key :platform_ids, Array
    timestamps!

    many :languages, :in => :language_ids
    many :libraries, :in => :library_ids
    many :platforms, :in => :platform_ids
end
