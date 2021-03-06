Rails.application.routes.draw do
  get 'friend/add_friend'

  get 'sessions/new'

  get 'users/new'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get   '/search',  to:   'users#search'
  get '/add_friend', to: 'friend#add_friend'
  get '/confirm',  to:  'friend#confirm'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'static_pages#home'
resources :users

resources :users do
    get :search, :on => :collection
  end
end
