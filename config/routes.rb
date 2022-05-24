Rails.application.routes.draw do
  scope :v1, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
  end

  namespace :v1, defaults: { format: :json } do
    get '/private', to: 'private#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
