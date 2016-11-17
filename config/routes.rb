Rails.application.routes.draw do
  resources :rooms
  resources :users
  resources :games
  resources :series
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'invite', to: :invite, controller: :registration, as: :invite
  match 'confirm', to: 'registration#confirm', via: %i(get post), as: :confirm
end
