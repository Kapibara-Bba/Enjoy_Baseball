Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  resources :users, only: [:index, :show, :edit, :update]
  get 'teamselect' => 'teams#top'
  resources :teams
  resources :records

end
