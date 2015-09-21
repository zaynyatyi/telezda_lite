Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'password_resets/new'
  get 'password_resets/edit'

  get 'sessions/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'welcome#index'

  get 'signup'  => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'get_user_items' => 'users#get_user_items'
  get 'craft_item' => 'users#craft_item'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :cities, controller: 'city' do
    member do
      get :citizens, :apply, :yard, :tower, :room, :hydroponics
      post :stalk, :unstalk
    end
    resources :item do
      get :push_to_city_stock, :pop_from_city_stock
      post :push_to_city_stock, :pop_from_city_stock
    end
  end
end
