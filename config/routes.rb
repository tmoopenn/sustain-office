Rails.application.routes.draw do
<<<<<<< HEAD
  resources :events
  root "events#index"
=======

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  resources :events do 
    resources :participants
  end
  resources :users
  root to: 'events#index'
>>>>>>> 0d5cceaa5934d068731442ff85fe3a68b1c405c1
end
