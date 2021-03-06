Rails.application.routes.draw do
  root 'groups#index'
#login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
#joining group
  post '/join/:id' => 'groups#join_new_group', as: 'join_group'
  post '/leave/:id' => 'groups#leave_old_group', as: 'leave_group'
#signup
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
#attendance
  post '/event/:id/add_attendant' => 'attendances#create', as: 'create_attendance'
  delete '/event/:id/delete_attendant' => 'attendances#destroy', as: 'destroy_attendance'
  delete '/event/:id/delete_member_attendance' => 'attendances#destroy_member_attendance', as: 'destroy_member_attendance'
#message
  post '/message/:group_id' => 'groups#add_new_message', as: 'new_message'
  get '/group/:id/manage' => 'groups#manage_group', as: 'manage_group'
  resources :groups do
    resources :events, :only => [:index, :create, :new]
    resources :messages
  end

  resources :users
  resources :events, :only => [:show, :edit, :update, :destroy]

  resources :feedbacks
end



#                                     ROUTES
#          Prefix Verb   URI Pattern                            Controller#Action
#            root GET    /                                      groups#index
#           login GET    /login(.:format)                       sessions#new
#                 POST   /login(.:format)                       sessions#create
#          logout GET    /logout(.:format)                      sessions#destroy
#      join_group GET    /join/:id(.:format)                    groups#join_group
#          signup GET    /signup(.:format)                      users#new
#           users POST   /users(.:format)                       users#create
#    group_events GET    /groups/:group_id/events(.:format)     events#index
#                 POST   /groups/:group_id/events(.:format)     events#create
# new_group_event GET    /groups/:group_id/events/new(.:format) events#new
#          groups GET    /groups(.:format)                      groups#index
#                 POST   /groups(.:format)                      groups#create
#       new_group GET    /groups/new(.:format)                  groups#new
#      edit_group GET    /groups/:id/edit(.:format)             groups#edit
#           group GET    /groups/:id(.:format)                  groups#show 
#                 PATCH  /groups/:id(.:format)                  groups#update
#                 PUT    /groups/:id(.:format)                  groups#update
#                 DELETE /groups/:id(.:format)                  groups#destroy
#                 GET    /users(.:format)                       users#index
#                 POST   /users(.:format)                       users#create
#        new_user GET    /users/new(.:format)                   users#new
#       edit_user GET    /users/:id/edit(.:format)              users#edit
#            user GET    /users/:id(.:format)                   users#show
#                 PATCH  /users/:id(.:format)                   users#update
#                 PUT    /users/:id(.:format)                   users#update
#                 DELETE /users/:id(.:format)                   users#destroy
#      edit_event GET    /events/:id/edit(.:format)             events#edit
#           event GET    /events/:id(.:format)                  events#show
#                 PATCH  /events/:id(.:format)                  events#update
#                 PUT    /events/:id(.:format)                  events#update
#                 DELETE /events/:id(.:format)                  events#destroy
