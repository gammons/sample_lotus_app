class ApplicationLayout
  include Lotus::Layout

  def full_title
    base_title = "App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def page_title
    "Main"
  end
end

