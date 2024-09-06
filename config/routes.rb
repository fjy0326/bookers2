Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  
  post 'users/:id' => 'users#update', as: 'update_user'
  resources :users, only: [:create, :show, :edit, :update, :index, :show]
  resources :books, only: [:new, :create, :edit, :update, :destroy, :index, :show]

  get 'homes/about' => 'homes#about', as: 'about'
  get 'books' => 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
