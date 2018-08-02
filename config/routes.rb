Rails.application.routes.draw do
  root 'static_pages#home'
  get '/secret_page', to: 'static_pages#secret_page'
  get '/help', to: 'static_pages#help', as: 'help'
  get '/about', to: 'static_pages#about', as: 'about'
  get '/contact', to: 'static_pages#contact', as: 'contact'
  
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
