Rails.application.routes.draw do

  # root "pins#index"


 devise_for :users
 # root 'devise/sessions#create'

 devise_scope :user do
   get "/" => "devise/sessions#create"
 end

 resources :pins do
   member do
   put "like", to: "pins#upvote"
   end
 end

  # root 'main#home'
  get "dashboard", to: 'dashboard#index'
  get "oauth/connect", to: 'dashboard#instagram_connect'
  match "oauth/callback", to: 'dashboard#instagram_callback', via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
