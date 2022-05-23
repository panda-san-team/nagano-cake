class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer_id
    @order_details = @order.order_details
  end

  def update
    @order =Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "confirmed"
      @order.order_details.update_all(making_status: "pending")
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
