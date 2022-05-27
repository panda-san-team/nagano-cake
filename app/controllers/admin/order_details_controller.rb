class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail =OrderDetail.find(params[:id])
    @order = Order.find_by(id: @order_detail.order_id)
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)

    if params[:order_detail][:making_status] == "making"
      @order.update(status: 2)
      redirect_to request.referer
    end

    count = 0
    @order_details.each do |order_detail|
      if order_detail.making_status == "completed"
        count += 1
      end
    end

    if @order_details.count == count
      @order.update(status: 3)
      redirect_to request.referer
    end

  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
