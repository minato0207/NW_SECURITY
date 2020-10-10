Rails.application.routes.draw do
  get 'users/show'
  
  devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
 }
  resources :users, only: :show 
  root 'top#index'
  resources :posts do
    member do
      get 'search'
    end

  end




  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
