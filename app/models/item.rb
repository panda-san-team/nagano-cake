class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_items
  has_many :order_details
  has_many :orders, through: :order_details
  belongs_to :genre


  validates :text, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  
　def add_tax_price
　  (self.price * 1.1).round
　end
end
