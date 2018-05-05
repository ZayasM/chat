Rails.application.routes.draw do

  resources :rooms, only: [:index, :show, :create] do
    resources :messages, only: [:index, :show]
  end
  
  resources :users, only: [:create]

  mount ActionCable.server => '/cable'

end
