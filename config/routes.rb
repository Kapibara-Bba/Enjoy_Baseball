Rails.application.routes.draw do

  get 'records/index'
  get 'records/show'
  get 'records/new'
  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  get 'teamselect' => 'teams#top'
  resources :teams

end
