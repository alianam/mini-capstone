Rails.application.routes.draw do
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
