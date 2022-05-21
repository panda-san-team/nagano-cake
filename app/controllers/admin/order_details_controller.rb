class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail =OrderDetail.find(params[:id])
    @order_detail.save
  end
end
