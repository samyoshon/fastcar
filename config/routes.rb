Rails.application.routes.draw do
  get '/responses/reviews', to: 'proposals#reviews', as: 'new_review'
  put '/responses/reviews', to: 'proposals#create_reviews', as: 'create_review'

  resources :responses
  resources :proposals

  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions", :passwords => "users/passwords", :confirmations => "users/confirmations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'proposals#new'
end
