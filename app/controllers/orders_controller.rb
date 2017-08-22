class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    order = Order.new(
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:product_id],
      subtotal: product.price * quantity,
      tax: product.tax * quantity,
      total: product.total * quantity
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
