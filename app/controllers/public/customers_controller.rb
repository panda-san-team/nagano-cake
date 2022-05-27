class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path, flash: {info_edit_success: "登録情報を変更しました"}
    else
      render :edit and return
    end
  end

  def quit
    @customer = current_customer
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: "退会") #ここでis_deletedカラムの値を"退会"に更新
    reset_session
    redirect_to root_path, flash: {out_notice: "ありがとうございました。またのご利用をお待ちしております"}
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end

end

# https://qiita.com/amiblog/items/625287e1448285163d1e参考
