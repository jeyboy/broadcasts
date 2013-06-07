Broadcasts::Engine.routes.draw do
  resources :broadcasts, only: [:index, :destroy]
end

Rails.application.routes.draw do
  mount Broadcasts::Engine => '/broadcasts', as: 'broadcasts'
end

