class AddQuantityToCartedProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :carted_products, :quantity, :integer
  end
end
