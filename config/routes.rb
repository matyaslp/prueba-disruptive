Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'calculate',  to: 'home#calculate'

  root to: 'home#index'
end