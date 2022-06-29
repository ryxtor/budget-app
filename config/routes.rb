Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated do
      root to: 'groups#index', as: 'user'
    end

    unauthenticated do
      root to: 'menus#index', as: 'unauthenticated_user_root'
    end

    get '/sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :users
  resources :groups, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :fees, only: [:new, :create, :edit, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
