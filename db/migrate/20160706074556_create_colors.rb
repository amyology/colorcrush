class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :red
      t.string :green
      t.string :blue

      t.timestamps null: false
    end
  end
end
