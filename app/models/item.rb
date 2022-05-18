class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  has_many :order_details
  has_many :orders, through: :order_details
  belongs_to :genre

  with_options presence: true do
    validates :genre_id
    validates :name
    validates :introduction
    validates :price
    validates :is_active
    validates :image
  end
  
  def add_tax_price
　  (self.price * 1.1).round
　end
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end