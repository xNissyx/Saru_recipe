Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  scope module: :public do
    root 'homes#top'
    
    resource :users, only: [:show, :update] do
      member do
        get 'confirm'
        patch 'withdraw'
        get 'bookmarks'
      end
      # deviseのルーティングと被るため、informationを追加
      get 'information/edit', to: 'users#edit'
    end
    
    devise_for :users, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }
    post '/users/guest_login', to: 'users#guest_login'

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
  
  get '/admin', to: 'admin/homes#top'  

  devise_for :admins, controllers: {
      sessions: 'admin/sessions'
    }

  namespace :admin do
    resources :users, only: [:index, :update]
    resources :comments, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
