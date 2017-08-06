class ProductsController < ApplicationController
  def all_products
    @all_products = Product.all
    render 'all-products.html.erb'
  end

  def new_product
    render 'new-product-form.html.erb'
  end

  def product_created
    @product1 = Product.new({name: params["product_name"], price: params["product_price"], image: params["product_image"], description: params["product_description"]})
    @product1.save
    render 'product-created.html.erb'
  end
end
