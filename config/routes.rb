Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get '/registro' => 'registrations#new', as: :signup

  post '/registro' => 'registrations#create', as: :registration
end
