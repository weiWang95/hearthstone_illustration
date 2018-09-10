Rails.application.routes.draw do
  resource :home, only: [:index]

  resources :cards, only: [:index, :show]

  root 'homes#index'
end
