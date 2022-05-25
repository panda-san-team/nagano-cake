class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      redirect_to addresses_path, flash: {address_notice: "全ての項目を入力してください"}
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
    redirect_to addresses_path
    else
    render :edit
    end
  end

  def destroy
    Address.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
