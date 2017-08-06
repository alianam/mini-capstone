class ProductsController < ApplicationController
  def index
    @all_products = Product.all
    render 'index.html.erb'
  end

  def show
    url_id = params[:id]
    @product = Product.find_by(id: url_id)
    render 'show.html.erb'
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
