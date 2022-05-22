class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @new_cart_item = CartItem.find_by(item: @cart_item.item)
    if @new_cart_item.present?
      @cart_item.amount += @new_cart_item.amount
      @new_cart_item.destroy
    end

    if @cart_item.save
      flash[:notice] = "カートに商品が追加されました"
      redirect_to cart_items_path
    else
      render ('item/show')
    end
  end

  def index
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    @cart_item.save
    flash[:notice] = "商品の数量が更新されました"
    redirect_to request.referer
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "カートの商品が削除されました"
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:notice] = "カートの商品が全て削除されました"
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end