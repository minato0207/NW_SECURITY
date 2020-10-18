Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'users/show'
  get '/post' => 'posts#tag_search'
  get '/posttop'=>'posts#top'
 
  
  devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
 }
  
  resources :users, only: :show 

  root 'top#index'
  resources :posts  do
    resources :comments, only: [:create, :edit, :update, :destroy]
    
    resource :favorites, only: [:create, :destroy]

    member do
      get 'search'
      
    end

  end

 


  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
