Rails.application.routes.draw do
  #actioncable
  mount ActionCable.server => "/cable"
    resources :messages, only: [:index, :create]



  # login
  root to:'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # photo
  get '/photos', to: 'photos#index'
  get '/photos/new', to: 'photos#new'
  post '/photos', to: 'photos#create'
  #group
  get '/mygroups', to: 'groups#mygroups'
  get '/groups', to: 'groups#index'
  get '/groups/new', to: 'groups#new'
  get '/groups/:id', to: 'groups#show'
  get '/groups/:id/messages', to: 'groups#messages'
  post '/groups', to: 'groups#create'
  get '/groups/:id/edit', to: 'groups#edit'
  post '/group_member/:id', to: 'groups#add_member'
  patch '/groups/:id', to: 'groups#update'
  delete '/groups/:id', to: 'group#destroy'
  #group angular
    get '/ang_groups', to: 'groups#ang_index'
    get '/canvas', to: 'groups#canvas'

  # appointments
  get '/appointments', to:'appointments#index'
  get '/ang_appointments', to:'appointments#ang_index'
  get '/appointments/new', to: 'appointments#new'
  get '/appointments/:id', to: 'appointments#show'
  post '/appointments', to: 'appointments#create'
  get '/map', to: 'appointments#map'

  # user
  get '/users', to: 'users#index'

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :create]
      get '/groups', to: 'groups#index'
      get '/appointments', to:'appointments#index'
      post '/appointments', to: 'appointments#create'
      get '/appointments/:id', to: 'appointments#show'
      get '/myappointments', to:'appointments#myappointments'
      get '/users', to:'users#index'
      patch "/appointments/:id", to: "appointments#update"
    end
  end
end
