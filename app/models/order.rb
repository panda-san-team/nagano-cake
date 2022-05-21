class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum status: { waiting: 0, confirmed: 1, making: 2, preparing: 3, shipped: 4 }

end
