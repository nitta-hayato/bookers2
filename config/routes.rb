Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users, only: [:edit,  :index, :show, :update]
  resources :books, only: [:edit, :new, :create, :index, :show, :destroy, :update]
  # resources :post_images, only: [:new, :create, :index, :show]
end
