Rails.application.routes.draw do

  root 'advertisements#index'

  resources :admin, only: :index

  get 'auth/:provider/callback', to: 'access#omni'
  get 'auth/failure', to: redirect('advertisements#index')
  get 'login', to: 'access#login', as: 'login'
  post 'access/attempt_login'
  get 'logout', to: 'access#logout', as: 'logout'

  resources :advertisements do
    get 'view', on: :collection
  end

  resources :carts, only: :index
  resources :cart_products, only: [:index, :update, :destroy, :create]

  resources :categories, only: [:index, :new, :create, :destroy] do
    resources :sub_categories, only: [:index, :new, :create, :destroy]
  end

  resources :comments, except: [:edit, :show, :update] do
  end

  resources :pictures, only: :destroy

  resources :conversations, only: [:index, :create, :update] do
    resources :messages, only: [:index, :create, :update]
  end

  resources :users, except:[:delete] do
    member do
      patch 'change_password'
      get 'edit_password'
    end
  end

  # admin scope

  scope :admin, path: 'admin' do
    resources :advertisements do
      patch 'approve', on: :member
      get 'view', on: :collection
    end

    resources :carts, only: :index
    resources :cart_products, only: [:index, :update, :destroy, :create]

    resources :categories, only: [:index, :new, :create, :destroy] do
      resources :sub_categories, only: [:index, :new, :create, :destroy]
    end

    resources :comments, except: [:edit, :show, :update] do
      patch 'approve', on: :member
      get 'unapproved_index', on: :collection
    end

    resources :pictures, only: :destroy

    resources :conversations, only: :index do
      resources :messages, only: :index
    end

    resources :users, except:[:delete] do
      member do
        patch 'approve'
        patch 'change_password'
        get 'edit_password'
      end
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
