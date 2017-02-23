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
  get '/groups/:id/edit', to: 'groups#edit'
  patch '/groups/:id', to: 'groups#update'
  delete '/groups/:id', to: 'group#destroy'

  # appointments
  get '/appointments', to:'appointments#index'
  get '/appointments/new', to: 'appointment#new'
  post '/appointments', to: 'appointments#create'
end
