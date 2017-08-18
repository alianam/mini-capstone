class Image < ApplicationRecord
  belongs_to :product

  def image
    Image.find_by(id: product_id)
  end
end
