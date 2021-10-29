class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, :category, presence: true
  validates :price, :stock, presence: true, numericality: { only_integer: true }
  has_one_attached :photo
end
