class Item < ApplicationRecord
  has_one_attached :image
  # attachment :item_image
  has_many :cart_items
  has_many :order_details
  has_many :orders, through: :order_details
  belongs_to :genre

  with_options presence: true do
    validates :genre_id
    validates :name
    validates :introduction
    validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/ }
    validates :is_active, inclusion: {in: [true, false]}
    validates :image
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax_price
    (price * 1.1).floor
  end



end