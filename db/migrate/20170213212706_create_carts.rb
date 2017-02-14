class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :item
      t.string :brand
      t.string :price
      t.belongs_to :shop

      t.timestamps
    end
  end
end
