Rails.application.routes.draw do
  scope module: 'broadcasting' do
    resources :broadcasts, only: [:index, :destroy]
  end
end