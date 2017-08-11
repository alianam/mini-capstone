class Product < ApplicationRecord
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
