Rails.application.routes.draw do


  root "home#index"

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :bulletins do
    collection { get :search }
    resources :posts
    post "/posts/:post_id/good", to: "goods#good_toggle"
    post "/posts/:post_id/report", to: "reports#report_toggle"
  end

  get '/notifications/read_all' => 'notifications#read_all'

  resources :notifications

  devise_for :users
  
  resource :users, only: [:index] do
    collection { get :search }
  end

  get 'home/index'

  get '/home/update'

  get '/home/git'

  post '/tinymce_assets' => 'tinymce_assets#create'
  
  get "/knu/knu_world"
  
  post "/knu/key"
  
  ## 채팅 메세지 구현 By 상열 -----------------------------------------------------------------------------
  ## For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  
  resources :users, only: [:index]
  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]

  
  get "/members/show" => "members#show"
  # --------------------------------------------------------------------------------------------------------

  resources :vote_comments
  resources :links do
    member do
      put "like", to:    "links#upvote"
      put "dislike", to: "links#downvote"
    end
  resources :vote_comments, only: [:create, :destroy]
  end


end

