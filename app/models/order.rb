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
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

end
