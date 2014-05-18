require_relative 'timestamps'

class UserRepository
  include Lotus::Repository
  extend Timestamps

  def self.create(user)
    user.generate_token
    ret = super(user)
    persist_followers(user)
    ret
  end

  def self.persist_followers(user)
    user.followers.each do |follower|
      RelationshipRepository.persist_follower(user, follower)
    end
  end

  def self.followers(user)
    user.followers = RelationshipRepository.followers_for(user)
  end
end
