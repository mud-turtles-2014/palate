class CreateWineProperties < ActiveRecord::Migration
  def change
    create_table :wine_properties do |t|
      t.string :property_value
      t.belongs_to :property
      t.belongs_to :wine

      t.timestamps
    end
  end
end
