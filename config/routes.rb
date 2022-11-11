Rails.application.routes.draw do
  namespace :employees do
    get 'profiles/show'
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :employees, controllers: { invitations: 'employees/invitations' }
  devise_for :customers
  
  get "/select_option", to: "food_items#select_option"

  resources :food_items do
    get :discarded , on: :collection 
    get :restore , on: :member 
  end

  resources :addons do 
    get :discarded , on: :collection 
    get :restore , on: :member 
  end

  resources :group_items , shallow: true do
    get :discarded , on: :collection 
    get :restore , on: :member 
    resources :options 
  end
  
  resources :option_items

  resources :discounts do
    get :discarded , on: :collection
    get :restore , on: :member
  end

  resources :menus do 
    get :discarded, on: :collection
    get :restore, on: :member
  end

  resources :deals do
    get :discarded, on: :collection
    get :restore, on: :member
  end
  resources :menu_items
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
