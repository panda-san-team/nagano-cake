class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { tbc: 0, pending: 1, making: 2, completed: 3 }

  def subtotal
    item.with_tax_price * amount
  end

end
