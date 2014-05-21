SampleApp.setup_router do
  get '/', to: 'static_pages#home', as: :root

  resources :users do
    member do
      get :following
      get :followers
    end
  end

  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]


  get '/signup',  to: 'users#new', as: :signup
  get '/signin',  to: 'sessions#new', as: :signin
  delete '/signout', to: 'sessions#destroy', as: :signout
  get '/help',    to: 'static_pages#help', as: :help
  get '/about',   to: 'static_pages#about', as: :about
  get '/contact', to: 'static_pages#contact', as: :contact
end
