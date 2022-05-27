class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

with_options presence: true do
  validates :item_id
  validates :customer
  validates :amount
end

  def subtotal
    item.with_tax_price * amount
  end

end