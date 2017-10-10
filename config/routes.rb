Rails.application.routes.draw do
  resources :items, only: [:new, :create, :show, :index]
  resources :reviews, only: [:new, :create, :show, :index]
  resources :reviews do
    post :filter, on: :member
  end
end
