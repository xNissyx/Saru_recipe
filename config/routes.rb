Rails.application.routes.draw do
  scope module: :public do
    root 'homes#top'

    devise_for :users, controllers: {
      registrations: 'registrations',
      sessions: 'sessions'
    }
    post '/users/guest_login', to: 'sessions#guest_login'

    resource :users, only: [:show, :edit, :update] do
      member do
        get 'confirm'
        patch 'withdraw'
        get 'bookmarks'
      end
    end

    resources :recipes do
      resources :comments, only: [:create, :destroy]
      resource :bookmark, only: [:create, :destroy]
      collection do
        get 'search'
        get 'tag_search'
      end
    end

    resources :chatbots, only: [:create]
  end

  devise_for :admins, controllers: {
      sessions: 'sessions'
    }

  namespace :admin do
    resources :users, only: [:index, :update]
    resources :comments, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
