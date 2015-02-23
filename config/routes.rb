Rails.application.routes.draw do
  root 'groups#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/join/:id' => 'groups#join_group', as: "join_group"

  get '/signup' => 'users#new'
  post '/users' => 'users#create'


  resources :groups
  resources :users

end



#                                     ROUTES
#          Prefix Verb   URI Pattern                                Controller#Action
#            root GET    /                                          groups#index
#           login GET    /login(.:format)                           sessions#new
#                 POST   /login(.:format)                           sessions#create
#          logout GET    /logout(.:format)                          sessions#destroy
#          signup GET    /signup(.:format)                          users#new
#           users POST   /users(.:format)                           users#create
#     group_users GET    /groups/:group_id/users(.:format)          users#index
#                 POST   /groups/:group_id/users(.:format)          users#create
#  new_group_user GET    /groups/:group_id/users/new(.:format)      users#new
# edit_group_user GET    /groups/:group_id/users/:id/edit(.:format) users#edit
#      group_user GET    /groups/:group_id/users/:id(.:format)      users#show
#                 PATCH  /groups/:group_id/users/:id(.:format)      users#update
#                 PUT    /groups/:group_id/users/:id(.:format)      users#update
#                 DELETE /groups/:group_id/users/:id(.:format)      users#destroy
#          groups GET    /groups(.:format)                          groups#index
#                 POST   /groups(.:format)                          groups#create
#       new_group GET    /groups/new(.:format)                      groups#new
#      edit_group GET    /groups/:id/edit(.:format)                 groups#edit
#           group GET    /groups/:id(.:format)                      groups#show
#                 PATCH  /groups/:id(.:format)                      groups#update
#                 PUT    /groups/:id(.:format)                      groups#update
#                 DELETE /groups/:id(.:format)                      groups#destroy
