class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :item
      t.string :brand
      t.string :price

      t.timestamps
    end
  end
end
