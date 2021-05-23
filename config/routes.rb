Rails.application.routes.draw do
  resources :users
  resources :pictures
  get '/', to: "home#top"
 
end
