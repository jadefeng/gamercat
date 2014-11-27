# == Route Map
#
#       Prefix Verb   URI Pattern                        Controller#Action
#              GET    /auth/:provider/callback(.:format) sessions#create
# auth_failure GET    /auth/failure(.:format)            redirect(301, /)
#      signout GET    /signout(.:format)                 sessions#destroy
#     sessions POST   /sessions(.:format)                sessions#create
#      session DELETE /sessions/:id(.:format)            sessions#destroy
#         home GET    /home(.:format)                    homes#show
#        users GET    /users(.:format)                   users#index
#              POST   /users(.:format)                   users#create
#     new_user GET    /users/new(.:format)               users#new
#    edit_user GET    /users/:id/edit(.:format)          users#edit
#         user GET    /users/:id(.:format)               users#show
#              PATCH  /users/:id(.:format)               users#update
#              PUT    /users/:id(.:format)               users#update
#              DELETE /users/:id(.:format)               users#destroy
#         root GET    /                                  home#show
#     jumpycat GET    /jumpycat(.:format)                game#jumpy_cat
#

Rails.application.routes.draw do
	# beginning of routes.rb 
	# match "*path" => redirect("https://gamercat.herokuapp.com/%{path}"), :constraints => { :protocol => "http://" }
	# match "*path" => redirect("https://gamercat.herokuapp.com/%{path}"), :constraints => { :subdomain => "" }

  resources :plays

  resources :games

  get 'auth/:provider/callback', to: 'sessions#omni'
  # get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :users

  root to: "home#show"

  get '/jumpycat' => 'game#jumpy_cat'
end
