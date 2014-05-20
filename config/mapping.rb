SampleApp.setup_mapper :default do
  collection :microposts do
    entity Micropost

    attribute :id, Integer
    attribute :content, String
    attribute :user_id, Integer
    attribute :created_at, DateTime
    attribute :updated_at, DateTime
  end

  collection :users do
    entity User

    attribute :id, String
    attribute :name, String
    attribute :email, String
    attribute :created_at, DateTime
    attribute :updated_at, DateTime
    attribute :password_digest, String
    attribute :remember_token, String
    attribute :admin, Boolean
  end

  collection :relationships do
    entity Relationship

    attribute :id, String
    attribute :follower_id, Integer
    attribute :followed_id, Integer
    attribute :created_at, DateTime
    attribute :updated_at, DateTime

  end
end
