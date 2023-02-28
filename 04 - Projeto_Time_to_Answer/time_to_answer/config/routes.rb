Rails.application.routes.draw do
  namespace :profiles_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffirvce do
    get 'welcome/index'
  end
  devise_for :profiles
  devise_for :admins

end
