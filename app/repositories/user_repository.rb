class UserRepository
  include Lotus::Repository

  def self.persist(entity)
    entity.created_at ||= Time.now
    entity.updated_at = Time.now
    super(entity)
  end
end
