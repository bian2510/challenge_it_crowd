Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    resources :people, except: [:destroy, :new]
    resources :movies, except: [:destroy, :new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
