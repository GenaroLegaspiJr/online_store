class CreateVats < ActiveRecord::Migration[5.1]
  def change
    create_table :vats do |t|
      t.string :name
      t.float :rate

      t.timestamps
    end
  end
end
