class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  with_options presence: true do
    validates :customer_id
    validates :postal_code
    validates :address
    validates :name
    validates :shipping_cost
    validates :total_payment
    validates :payment_method
    validates :status
  end

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirmed: 1, making: 2, preparing: 3, shipped: 4 }

  def sum_amount
    sum = 0
    order_details.each do |order_detail|
      sum += order_detail.amount
    end
    sum
  end

  def sum_subtotal
    self.total_payment - self.shipping_cost
  end

end
