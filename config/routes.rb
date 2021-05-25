Rails.application.routes.draw do
  resources :contacts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users 
  resources :pictures do
    collection do
      post :confirm
    end
    member do
      get :favorite
    end
  end
  get '/', to: "home#top"
  resource :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
