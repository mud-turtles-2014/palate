class AddIsBlindColToTastings < ActiveRecord::Migration
  def change
    add_column :tastings, :is_blind, :boolean, default: true
  end
end
