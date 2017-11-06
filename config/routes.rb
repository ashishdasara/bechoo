Rails.application.routes.draw do


  root 'advertisements#index'


  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :comments, :carts, :cart_products


  scope '/admin' do
    resources :sub_categories
    resources :categories do
      member do
        get :delete
      end
    end
  end

  resources :conversations do
    resources :messages
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
