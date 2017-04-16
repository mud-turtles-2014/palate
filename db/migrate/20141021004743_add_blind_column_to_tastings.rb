class AddBlindColumnToTastings < ActiveRecord::Migration
  def change
    add_column :tastings, :is_blind, :boolean, null: false, default: false
  end
end
