Rails.application.routes.draw do

  get "/about" => 'events#about'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :users
  resources :events
  root to: 'events#index'

  resources :events do
    resources :participants
  end

end
