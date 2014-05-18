module Timestamps
  def persist(entity)
    set_timestamps(entity)
    super(entity)
  end

  def create(entity)
    set_timestamps(entity)
    super(entity)
  end

  def update(entity)
    set_timestamps(entity)
    super(entity)
  end

  private

  def set_timestamps(entity)
    entity.created_at ||= Time.now
    entity.updated_at ||= Time.now
  end
end
