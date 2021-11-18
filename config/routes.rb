Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :profiles, only: [:show, :new, :edit, :create, :update]
  post 'posts/new' => 'posts#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
