class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.integer :quantity
      t.integer :price
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
