Rails.application.routes.draw do

  root to: 'homes#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :teams, only: [:show, :new, :create, :edit, :update] do
    resources :posts, only: [:index, :create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  get 'records/batter' => 'records#batter_index'
  get 'records/pitch' => 'records#pitch_index'
  resources :records, only: [:new, :create, :update]
  resources :infos, only: [:new, :create, :show, :edit, :update, :destroy]
  get '/map_request', to: 'infos#map', as: 'map_request'
  resources :team_records, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  #resources :posts, only: [:show, :create, :destroy]
end
