class AddTastingNotesColToTastings < ActiveRecord::Migration
  def change
    add_column :tastings, :tasting_notes, :text
  end
end
