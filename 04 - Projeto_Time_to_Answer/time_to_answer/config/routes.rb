Rails.application.routes.draw do

  namespace :admins_backoffice do
    get 'admins/index' #dasboard
    #get 'admins/edit/:id', to: "admins#edit"
    resource :admins #Adminsitradores
    resource :subjects # Assuntos
    resource :questions
    get 'questions/index' #index questions
  end
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    post 'answer', to: 'answer#question'
    get 'subject/:subject_id/:subject_name', to: 'search#subject', as: 'search_subject'
  end
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to:'profile#edit'
    #atualização do registro (patch - parte dos dados ou put - todos os dados)
    patch 'profile', to:'profile#update'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  # Bloqueia a rota /admins/sign_up
  #devise_for :admins, :skip => [:registrations] do
  devise_for :admins do
     get 'admins/sign_out', to: 'devise/sessions#destroy'
  end

  devise_for :users

  get 'backoffice', to: 'admins_backoffice/welcome#index'

    #delete '/admins/sign_out', to: 'site/welcome#index'
    #get 'index', to:'site/welcome#index'
  root to: 'site/welcome#index'

end
