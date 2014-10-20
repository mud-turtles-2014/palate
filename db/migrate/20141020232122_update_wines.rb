class UpdateWines < ActiveRecord::Migration
  def change
    add_column :wines, :grape, :string
    add_column :wines, :country, :string
  end
end
