class User
  include Lotus::Entity

  attr_accessor :followers

  def admin?
    admin == true
  end

  def following?(user)
    @followers ||= []
    @followers.include?(user)
  end

  def follow!(user)
    @followers ||= []
    @followers << user unless @followers.include?(user)
  end
end
