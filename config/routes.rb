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
#manage
  get '/group/:id/manage' => 'groups#manage_group', as: 'manage_group'
  
  resources :groups do
    resources :events, :only => [:index, :create, :new]
    resources :messages
  end

  resources :users
  resources :events, :only => [:show, :edit, :update, :destroy]

  resources :feedbacks
end



#                    Prefix Verb   URI Pattern                                   Controller#Action
#                      root GET    /                                             groups#index
#                     login GET    /login(.:format)                              sessions#new
#                           POST   /login(.:format)                              sessions#create
#                    logout GET    /logout(.:format)                             sessions#destroy
#                join_group POST   /join/:id(.:format)                           groups#join_new_group
#               leave_group POST   /leave/:id(.:format)                          groups#leave_old_group
#                    signup GET    /signup(.:format)                             users#new
#                     users POST   /users(.:format)                              users#create
#         create_attendance POST   /event/:id/add_attendant(.:format)            attendances#create
#        destroy_attendance DELETE /event/:id/delete_attendant(.:format)         attendances#destroy
# destroy_member_attendance DELETE /event/:id/delete_member_attendance(.:format) attendances#destroy_member_attendance
#              manage_group GET    /group/:id/manage(.:format)                   groups#manage_group
#              group_events GET    /groups/:group_id/events(.:format)            events#index
#                           POST   /groups/:group_id/events(.:format)            events#create
#           new_group_event GET    /groups/:group_id/events/new(.:format)        events#new
#            group_messages GET    /groups/:group_id/messages(.:format)          messages#index
#                           POST   /groups/:group_id/messages(.:format)          messages#create
#         new_group_message GET    /groups/:group_id/messages/new(.:format)      messages#new
#        edit_group_message GET    /groups/:group_id/messages/:id/edit(.:format) messages#edit
#             group_message GET    /groups/:group_id/messages/:id(.:format)      messages#show
#                           PATCH  /groups/:group_id/messages/:id(.:format)      messages#update
#                           PUT    /groups/:group_id/messages/:id(.:format)      messages#update
#                           DELETE /groups/:group_id/messages/:id(.:format)      messages#destroy
#                    groups GET    /groups(.:format)                             groups#index
#                           POST   /groups(.:format)                             groups#create
#                 new_group GET    /groups/new(.:format)                         groups#new
#                edit_group GET    /groups/:id/edit(.:format)                    groups#edit
#                     group GET    /groups/:id(.:format)                         groups#show
#                           PATCH  /groups/:id(.:format)                         groups#update
#                           PUT    /groups/:id(.:format)                         groups#update
#                           DELETE /groups/:id(.:format)                         groups#destroy
#                           GET    /users(.:format)                              users#index
#                           POST   /users(.:format)                              users#create
#                  new_user GET    /users/new(.:format)                          users#new
#                 edit_user GET    /users/:id/edit(.:format)                     users#edit
#                      user GET    /users/:id(.:format)                          users#show
#                           PATCH  /users/:id(.:format)                          users#update
#                           PUT    /users/:id(.:format)                          users#update
#                           DELETE /users/:id(.:format)                          users#destroy
#                edit_event GET    /events/:id/edit(.:format)                    events#edit
#                     event GET    /events/:id(.:format)                         events#show
#                           PATCH  /events/:id(.:format)                         events#update
#                           PUT    /events/:id(.:format)                         events#update
#                           DELETE /events/:id(.:format)                         events#destroy
#                 feedbacks GET    /feedbacks(.:format)                          feedbacks#index
#                           POST   /feedbacks(.:format)                          feedbacks#create
#              new_feedback GET    /feedbacks/new(.:format)                      feedbacks#new
#             edit_feedback GET    /feedbacks/:id/edit(.:format)                 feedbacks#edit
#                  feedback GET    /feedbacks/:id(.:format)                      feedbacks#show
#                           PATCH  /feedbacks/:id(.:format)                      feedbacks#update
#                           PUT    /feedbacks/:id(.:format)                      feedbacks#update
#                           DELETE /feedbacks/:id(.:format)                      feedbacks#destroy
