Rails.application.routes.draw do
  resources :responses
  resources :proposals
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions", :passwords => "users/passwords", :confirmations => "users/confirmations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'proposals#new'
end
