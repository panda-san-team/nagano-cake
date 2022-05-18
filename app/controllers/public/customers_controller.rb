class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer 
  end
  
  def edit
    @customer = current
  end
  
  def update
  end
  
  def quit
  end
  
  def out
  end
  
end
