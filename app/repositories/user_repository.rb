require_relative 'timestamps'

class UserRepository
  include Lotus::Repository
  extend Timestamps

  def self.create(user)
    user.generate_token
    ret = super(user)
    ret
  end
end
