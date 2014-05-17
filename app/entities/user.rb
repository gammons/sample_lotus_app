class User
  include Lotus::Entity
  self.attributes = :email, :password, :name
end
