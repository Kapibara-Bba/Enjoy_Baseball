Rails.application.routes.draw do

  root to: 'homes#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: [:index, :show, :edit, :update]
  get 'teamselect' => 'teams#top'
  resources :teams
  resources :records

end
