class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
