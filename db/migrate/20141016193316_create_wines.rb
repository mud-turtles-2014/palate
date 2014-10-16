class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name, null: false
      t.string :color, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
