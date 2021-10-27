class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :quantity, presence: true, numericality: { only_integer: true }
  # validates :checkbox
end
