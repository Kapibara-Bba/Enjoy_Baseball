Rails.application.routes.draw do

  root to: 'homes#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :teams
  resources :users
  resources :records
  get 'records/batter' => 'records#batter_index'
  get 'records/pitch' => 'records#pitch_index'

end
