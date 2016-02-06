Minxtape::Application.routes.draw do
  resources :tracks

  resources :mixes do
    resources :tracks
  end

  devise_for :users
  
  resources :users do
    resources :mixes
  end
  
  match 'signup' => 'users#new',        :as => :signup, via: :get
  match 'logout' => 'sessions#destroy', :as => :logout, via: :get
  match 'login' => 'sessions#new',      :as => :login,  via: :post

  root :to => 'mixes#index'
end
