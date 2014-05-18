require_relative 'timestamps'

class UserRepository
  include Lotus::Repository
  extend Timestamps

  def self.create(user)
    token = SecureRandom.urlsafe_base64
    user.remember_token = Digest::SHA1.hexdigest(token.to_s)
    super(user)
  end
end
