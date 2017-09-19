Rails.application.routes.draw do
  get 'leaderboard/bygen'

  get 'leaderboard/bysubgen'

  get 'leaderboard/index'

  resources :states
  get 'questionview/index'

  get 'questionview/next'

  get 'questionview/prev'

  get 'genquiz/create'

  get 'userpg/index'

  get 'gen_sub_gen/create'

  resources :mcqs
  resources :sub_genres
  resources :genres
 # get 'admin/index'

  #get 'sessions/new'
  #root 'welcome#index'
  get 'sessions/create'

  get 'sessions/destroy'

  resources :users

  get 'admin' => 'admin#index'

  controller :sessions do
  	get 'login' => :new
  	post 'login' => :create
  	delete 'logout' => :destroy
  end
  #root :to => redirect("/login")
  root 'admin#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end