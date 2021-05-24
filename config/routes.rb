Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
      get :favorite
    end
  end
  resources :pictures
  get '/', to: "home#top"
  resource :favorites, only: [:create, :destroy]
end
