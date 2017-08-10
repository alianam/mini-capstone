class Product < ApplicationRecord
  def sale_message
    if price < 2
      return "Discount Item!"
    else
      return "Everyday Value!"
    end 
  end

  def tax
    (price * 0.09).round(3)
  end

  def total
    price + tax
  end
end
