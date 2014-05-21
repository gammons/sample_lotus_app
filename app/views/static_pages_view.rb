module StaticPages
  class Home
    include Lotus::View
    layout :application

    def signed_in?(*args)
      false
    end

    def link_to(*args)
      p "here"
    end

    # def link_to(name, url, options = {})
    #   "<a href=#{url}>#{name}</a>"
    # end
  end
end
