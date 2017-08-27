class CartedProduct < ApplicationRecord
  validates :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional: true
end
