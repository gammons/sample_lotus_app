class Form < Reform::Form
  def validate(params, listener = nil)
    return true if super(params.stringify_keys)

    listener && listener.form_invalid

    false
  end

  def populate(*args)
    validate(*args)
    valid? && save
    model
  end
end
