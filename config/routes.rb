Rails.application.routes.draw do
  scope module: :api, defaults: { format: 'json' } do
    scope module: :v1, path: :v1 do
      resources :articles, only: :show

      resources :users, only: :index, path: :owners
      get ':owner_name', to: 'users#show'

      get ':owner_name/articles', to: 'user_articles#index'
    end
  end
end
