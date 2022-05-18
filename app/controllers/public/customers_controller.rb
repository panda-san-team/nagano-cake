class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def quit
    @customer = Customer.find_by(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "またのご利用をお待ちしております"
    redirect_to root_path
  end

  def out
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end

end
