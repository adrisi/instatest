Rails.application.routes.draw do
  root 'dashboard#index'
  get "oauth/connect", to: 'dashboard#instagram_connect'
  match "oauth/callback", to: 'dashboard#instagram_callback', via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
