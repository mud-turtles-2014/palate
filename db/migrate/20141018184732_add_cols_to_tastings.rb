class AddColsToTastings < ActiveRecord::Migration
  def change
    add_column :tastings, :event_wine_id, :integer
    remove_column :tastings, :wine_id
  end
end
