class CreateDupes < ActiveRecord::Migration
  def change
    create_table :dupes do |t|
      t.integer :primary_id
      t.integer :secondary_id

      t.timestamps null: false
    end
  end
end
