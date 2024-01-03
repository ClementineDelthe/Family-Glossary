Rails.application.routes.draw do
  devise_for :users
  root to: "definitions#index"
  resources :definitions, except: :index do
    collection do
      get :mes_definitions
      get :week
      get :top
    end
    resources :comments do
      member do
        post "like", to: "comments#like"
        delete "unlike", to: "comments#unlike"
      end
    end
    member do
      # post "like", to: "definitions#show"
      # match 'like', to: 'definitions#show', via: [:get, :post]
      # delete "unlike", to: "definitions#show"
      # post 'like', to: 'definitions#create_like'
      # delete 'like', to: 'definitions#destroy_like'
      post 'like', to: 'likes#create'
      delete 'like', to: 'likes#destroy_like'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
