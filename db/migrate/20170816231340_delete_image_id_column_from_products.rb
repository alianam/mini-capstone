class DeleteImageIdColumnFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :image_id, :string
  end
end
