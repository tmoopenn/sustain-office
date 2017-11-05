Rails.application.routes.draw do
  resources :events do 
    resources :participants
  end
  resources :users
  root to: 'events#index'
end
