Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
