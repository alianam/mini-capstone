class OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    @ordered_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = 0
    @ordered_products.each do |ordered_product|
      subtotal += ordered_product.product.price * ordered_product.quantity
    end    
    tax = subtotal * 0.09
    total = subtotal + tax

    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    order.save

    @ordered_products.each do |ordered_product|
      ordered_product.update(status: "purchased", order_id: order.id)
    end  
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @order_id = @order.id
    render 'show.html.erb'
  end
end
