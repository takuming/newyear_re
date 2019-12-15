Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  root to: 'page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # APIコントローラへのルーティング
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :goals, only: [:index, :show, :create,:update, :destroy]
    end
  end
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :efforts, only: [:index, :show, :create, :update]
    end
  end
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :lbmonths, only: [:index, :show, :create,:update]
    end
  end
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :lbreflections, only: [:index, :show, :create,:update]
    end
  end
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :lbcuriosities, only: [:index, :show, :create,:update]
    end
  end
  
  
end
