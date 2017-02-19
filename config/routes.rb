Rails.application.routes.draw do
  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #group
  get '/groups', to: 'groups#index'
  get '/groups/new', to: 'groups#new'
  get '/groups/:id', to: 'groups#show'
  post '/groups', to: 'groups#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
