Rails.application.routes.draw do

  resources :rooms, only: [:index, :show, :create]
  resources :users, only: [:create] 

end
