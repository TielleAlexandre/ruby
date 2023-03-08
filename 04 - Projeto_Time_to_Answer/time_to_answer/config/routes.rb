Rails.application.routes.draw do

  namespace :admins_backoffice do
    get 'admins/index' #dasboard
    #get 'admins/edit/:id', to: "admins#edit"
    resource :admins #Adminsitradores
    resource :subjects # Assuntos
  end
  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  devise_for :admins
    # get 'admins/sign_out' => 'devise/sessions#destroy'
    #end
  devise_for :users

    #get 'admins/sign_out', to: 'devise/sessions#destroy'
  #delete '/admins/sign_out', to: 'site/welcome#index'
  get 'index', to:'site/welcome#index'
  root to: 'site/welcome#index'

end
