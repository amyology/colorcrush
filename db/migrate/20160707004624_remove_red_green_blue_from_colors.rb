class RemoveRedGreenBlueFromColors < ActiveRecord::Migration
  def change
    remove_column :colors, :red, :string
    remove_column :colors, :green, :string
    remove_column :colors, :blue, :string
  end
end
