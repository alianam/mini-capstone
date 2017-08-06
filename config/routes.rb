Rails.application.routes.draw do
  get '/all-products' => 'products#all_products'
  get '/new-product-form' => 'products#new_product'
  post '/product-created' => 'products#product_created'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
