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
  end
  
  def update
    @order =Order.find(params[:id])
    @order.save
  end
  
end
