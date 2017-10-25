Rails.application.routes.draw do

  root 'access#login'


  get 'access/menu'
  get 'access/login'
  get 'access/signup'
  post 'access/attempt_login'
  get 'access/logout'

  resources :categories do
    member do
      get :delete
    end
  end
  resources :sub_categories do
    member do
      get :delete
    end
  end
  resources :users do
    member do
      get :delete
    end
  end

  get 'advertisements/view'
  resources :advertisements do
    member do
      get :delete
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
