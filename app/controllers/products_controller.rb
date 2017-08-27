class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  
  def index
    # if params[:sort_by] && params[:order]
    #   @all_products = Product.order(params[:sort_by] => params[:order])
    # elsif params[:sort_by] == "discount"
    #   @all_products = Product.where("price < ?", 2)
    # elsif params[:product_name]
    #   @all_products = Product.where("name LIKE ?", "%#{params[:product_name]}%")
    # else
    #   @all_products = Product.all
    # end
    if params[:category]
      @products = Category.find_by(name: params[:category].capitalize).products
    else
      @products = Product.all
    end
    render 'index.html.erb'
  end

  def show
    if params[:id] == "random"
      all_products = Product.all
      @product = all_products.sample
    else 
      url_id = params[:id]
      @product = Product.find_by(id: url_id)
    end
    render 'show.html.erb'
  end

  def new
    @product1 = Product.new
    render 'new.html.erb'
  end

  def create
    @product1 = Product.new(
      name: params[:product_name],
      price: params[:product_price],
      # image: params[:product_image],
      description: params[:product_description],
      in_stock: params[:in_stock]
    )
    @product1.save
    if @product1.errors.any?
      flash[:warning] = "Your save did not complete."
      render 'new.html.erb'
    else
      flash[:success] = "You've just created a new product: #{@product1.name}."
      redirect_to "/products/#{@product1.id}"
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(name: params[:product_name],
      price: params[:product_price],
      # image: params[:product_image], 
      description: params[:product_description],
      in_stock: params[:in_stock]
      )
    if @product.errors.any?
      flash[:warning] = "Your update did not complete and will not be saved."
      render 'edit.html.erb'
    else
      flash[:info] = "Wooooo you've successfully updated #{@product.name}."
      redirect_to "/products/#{@product.id}"
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:danger] = "Awww man. You've deleted #{product.name}."
    redirect_to "/products"
  end
end
