class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.float :price
      t.references :vat, foreign_key: true

      t.timestamps
    end
  end
end
