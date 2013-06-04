Broadcasting::Engine.routes.draw do
  scope module: 'broadcasting' do
    #resources :broadcasts, only: [:index, :destroy]
    match 'broadcasts_list' => 'broadcasts#index', via: :post, as: 'broadcasts_list'
    match 'close_broadcast/:id' => 'broadcasts#destroy', via: :delete, as: 'close_broadcast'
  end
end