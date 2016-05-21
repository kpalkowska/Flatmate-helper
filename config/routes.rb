Rails.application.routes.draw do
  get 'flats/new'

  resources :maps
  get 'sessions/new'

  root             'static_pages#home'
  get 'signup'   => 'flatmates#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :flatmates
  resources :flats
end
