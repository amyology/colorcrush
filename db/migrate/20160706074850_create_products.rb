class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :product_type
      t.integer :color_id

      t.timestamps null: false
    end
  end
end
