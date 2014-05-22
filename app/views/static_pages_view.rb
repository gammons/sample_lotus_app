module StaticPages
  class Home
    include Lotus::View
    layout :application

    def signed_in?(*args)
      false
    end

    def sign_up_now_link
      %Q(<a class="btn btn-large btn-primary" href="#{SampleApp.router.path(:signup)}">Sign up now!</a>)
    end

    def root_path
      SampleApp.router.path(:root)
    end

    def help_path
      SampleApp.router.path(:help)
    end

    def signin_path
      SampleApp.router.path(:signin)
    end

    def link_to(name, url, options = {})
      opts_str = options.map {|k,v| "#{k}=#{v}" }.join
      %Q(<a #{opts_str} href="#{url}">#{name}</a>)
    end

    def about_path
      SampleApp.router.path(:about)
    end

    def contact_path
      SampleApp.router.path(:contact)
    end

    def flash
      {}
    end
  end
end
