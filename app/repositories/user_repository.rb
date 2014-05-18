require_relative 'timestamps'

class UserRepository
  include Lotus::Repository
  extend Timestamps

  def self.create(user)
    user.generate_token
    ret = super(user)
    handle_followers(user)
    ret
  end

  def self.handle_followers(user)
    return unless user.followers
    Array(user.followers).each do |follower|
      RelationshipRepository.persist(follower)
    end
  end
end
