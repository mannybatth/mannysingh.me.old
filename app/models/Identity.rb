class Identity
    include MongoMapper::Document
    include OmniAuth::Identity::Models::MongoMapper

    key :email, String
    key :password_digest, String
end
