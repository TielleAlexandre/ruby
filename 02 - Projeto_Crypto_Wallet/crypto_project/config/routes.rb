Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  resources :coins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  #get 'index', to: 'welcome#index'
  #get 'coins', to: "coins#index"
  # get 'welcome/index'

end
