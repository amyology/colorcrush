class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :text
      t.integer :dupe_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
