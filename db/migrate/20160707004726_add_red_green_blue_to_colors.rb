class AddRedGreenBlueToColors < ActiveRecord::Migration
  def change
    add_column :colors, :red, :integer
    add_column :colors, :green, :integer
    add_column :colors, :blue, :integer
  end
end
