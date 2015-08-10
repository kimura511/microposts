Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'setting'   => 'users#edit'
  get    'setting'   => 'users#view'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :microposts
  resources :users do
    member do
      get :followings
      get :followers
    end
  end

#  resources :microposts do
#       member do
#         get 'followings-followers'
#       end
#  end
end