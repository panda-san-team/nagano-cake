class Item < ApplicationRecord
  
  validates :text, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end
