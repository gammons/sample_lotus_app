require_relative 'timestamps'

class UserRepository
  include Lotus::Repository
  extend Timestamps

  def self.create(user)
    user.generate_token
    super(user)
  end
end
