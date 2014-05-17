class User
  include Lotus::Entity

  def admin?
    admin == true
  end
end
