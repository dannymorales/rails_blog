Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users
  resources :posts do
  resources :comments
  end
  root 'posts#index'
  get 'users/index', to: 'users#index', as: 'users_index'
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

end
