Rails.application.routes.draw do
  devise_for :users
  root to: 'study_materials#index'
  
  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: :dashboard
    
    resources :groups do
      resources :students, only: [:index, :create, :destroy]
      resources :study_materials, only: [:new, :create, :destroy]
    end
    
    resources :students, only: [:index]
  end
  
  resources :study_materials, only: [:index, :show]
  resources :groups, only: [:index, :show]
end