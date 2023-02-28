Rails.application.routes.draw do
  namespace :site do
    end
  resources :planta
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'index', to: 'welcome#index'
end
