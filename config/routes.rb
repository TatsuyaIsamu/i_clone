Rails.application.routes.draw do
  resources :pictures
  get '/', to: "home#top"
 
end
