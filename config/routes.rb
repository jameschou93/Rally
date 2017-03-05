Rails.application.routes.draw do
  # login
  root to:'sessions#new'
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
  post '/group_member/:id', to: 'groups#add_member'
  patch '/groups/:id', to: 'groups#update'
  delete '/groups/:id', to: 'group#destroy'

  # appointments
  get '/appointments', to:'appointments#index'
  get '/appointments/new', to: 'appointments#new'
  post '/appointments', to: 'appointments#create'

#   namespace :api do
#     namespace :v1 do
#   get '/groups'
#     end
#   end
end
