class OrdersController < ApplicationController
  def create
    order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: session[:user_id],
    )
    order.save
    redirect_to "/orders/#{order.id}"
    flash[:success] = "You've added the product to your cart"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @order_id = @order.id
    @quantity = @order.quantity
    render 'show.html.erb'
  end
end


# order = Order.find_by(order_id: params[:order_id])