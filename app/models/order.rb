class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  # validates :quantity, presence: true
  # validates :quantity, numericality: { only_integer: true }
  validates :product_id, :user_id, presence: true
  # validates :checkbox
end
