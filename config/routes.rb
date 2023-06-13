Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  scope module: :public do
    root 'homes#top'

    resource :user, only: [:update] do
      member do
        get 'confirm'
        patch 'withdraw'
        get 'bookmarks'
      end
      # deviseのルーティングと被るため、informationを追加
      get 'information/edit', to: 'users#edit'
      get 'mypage', action: :show
    end

    devise_scope :user do
      # 新規登録失敗後のリダイレクトのエラーを防ぐルーティング
      get '/users', to: 'registrations#new'
    end

    devise_for :users, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }
    post '/users/guest_login', to: 'users#guest_login'

    resources :recipes do
      resources :comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end

    # タグ検索用ルーティング
    get 'tags/:tag_id/recipes', to: 'recipes#tag_search', as: 'tag_recipes'

    resources :chatbots, only: [:create]
  end

  get '/admin', to: 'admin/homes#top'

  devise_for :admins, controllers: {
      sessions: 'admin/sessions'
    }

  namespace :admin do
    resources :users, only: [:index, :update]
    resources :comments, only: [:index, :destroy]
    resources :tags, except: [:show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
