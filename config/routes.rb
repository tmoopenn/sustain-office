Rails.application.routes.draw do

  get "/about" => 'events#about'
  get "/all" => 'events#all'
  get "/leaderboard" => 'users#leaderboard'
  get "/contact" => 'users#contact'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :users
  resources :events
  root to: 'events#index'

  resources :events do
    resources :registrees
  end
  resources :occurrences do
    resources :attendees
  end

end
