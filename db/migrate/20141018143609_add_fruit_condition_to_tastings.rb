class AddFruitConditionToTastings < ActiveRecord::Migration
  def change
    add_column :tastings, :fruit_condition, :integer
  end
end
