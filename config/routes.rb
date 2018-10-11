Rails.application.routes.draw do
  resource :home, only: [:index]

  resources :cards, only: [:index, :show]

  namespace :admin do
    resource :sessions, only: [:new, :create, :destroy]
    resources :dashboards, only: [:index]
    resources :cards, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :professions, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :effects, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show]
  end

  root 'homes#index'
end
