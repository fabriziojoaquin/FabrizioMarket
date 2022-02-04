Rails.application.routes.draw do
  resources :contents
  devise_for :users
  root 'pages#home'

get 'about' => 'pages#about'

post '/compra/:slug', to: 'checkout#create', as: :compra

get '/pickup/:guide', to: 'checkout#pickup', as: :pickup
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
