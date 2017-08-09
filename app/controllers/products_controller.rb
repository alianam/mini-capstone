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

  def new
    render 'new.html.erb'
  end

  def create
    @product1 = Product.new(
      name: params["product_name"],
      price: params["product_price"],
      image: params["product_image"],
      description: params["product_description"]
    )
    @product1.save
    flash[:success] = "You've just created a new product: #{@product1.name}."
    redirect_to "/products/#{@product1.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(name: params["product_name"],
      price: params["product_price"],
      image: params["product_image"], 
      description: params["product_description"]
      )
    flash[:info] = "Wooooo you've successfully updated #{@product.name}."
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:danger] = "Awww man. You've deleted #{product.name}."
    redirect_to "/products"
    # render 'index.html.erb'
  end
end
