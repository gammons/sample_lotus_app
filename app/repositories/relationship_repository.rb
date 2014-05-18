require_relative 'timestamps'

class RelationshipRepository
  include Lotus::Repository
  extend Timestamps

  def self.persist_follower(user, follower)
    relationship = Relationship.new(follower_id: user.id, followed_id: follower.id)
    persist(relationship)
  end

  def self.followers_for(user)
    query do
      where(follower_id: user.id)
    end.all
  end
end

