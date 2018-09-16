class AddQuantityToBaskets < ActiveRecord::Migration[5.1]
  def change
    add_column :baskets, :quantity, :integer
  end
end
