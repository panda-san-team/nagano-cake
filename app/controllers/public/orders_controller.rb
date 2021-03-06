class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      unless current_customer.addresses.exists?
        flash[:order_notice] = "登録済みの住所がありません"
        render "new"
      else
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      end
    elsif params[:order][:select_address] == "2"
      if ( params[:order][:postal_code] || params[:order][:address] || params[:order][:name] ).empty?
        flash[:order_notice] = "住所を正しく入力してください"
        render "new"
      else
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      end
    else
      flash[:order_notice] = "住所を選択してください"
      render "new"
    end
    @cart_items = current_customer.cart_items
    @shipping_cost = 800
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @total_payment = @shipping_cost + @total_price
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.create(order_id: @order.id,
                                           item_id: cart_item.item_id,
                                           amount: cart_item.amount,
                                           price: cart_item.item.price*1.10
                                           )
      end
      @cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      render :confirm
    end
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

    def order_params
      params.require(:order).permit(
        :postal_code,
        :address,
        :name,
        :shipping_cost,
        :total_payment,
        :payment_method
        )
    end
end