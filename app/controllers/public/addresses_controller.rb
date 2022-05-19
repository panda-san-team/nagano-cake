class Public::AddressesController < ApplicationController
  
  def index
    @customer = current_customer
    @address = @customer.address.new
    @addresses = @customer.addresses.all
  end
  
  def create
    @customer = current_customer
    @address = @customer.address.new(customer_params)
    @address.update
    redirect_to addresses_path
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
