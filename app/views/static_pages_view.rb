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
  end
end
