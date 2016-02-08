Minxtape::Application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :tracks

  resources :mixes do
    resources :tracks
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users do
    resources :mixes
  end
  
  match 'signup' => 'users#new',        :as => :signup, via: :get
  match 'logout' => 'sessions#destroy', :as => :logout, via: :get
  match 'login' => 'sessions#new',      :as => :login,  via: :post

  root :to => 'mixes#index'
end
