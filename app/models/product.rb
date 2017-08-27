class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {in: 1..1000}
  validates :description, length: {maximum: 500}
  belongs_to :supplier, optional: true
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products
  
  def sale_message
    if price < 2
      return "Discount Item!"
    else
      return "Everyday Value!"
    end 
  end

  def tax
    (price * 0.09).round(2)
  end

  def total
    price + tax
  end

  def stock_boolean
    if in_stock == true
      "Yes"
    else
      "No, sorry."
    end
  end

  # def self.expensive
  #   where(price: 30)
  # end

  # def self.myself
  #   self
  # end

  # def instance_self
  #   self
  # end
end
