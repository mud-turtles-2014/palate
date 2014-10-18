class CreateTastings < ActiveRecord::Migration
  def change
    create_table :tastings do |t|
      t.integer :red_fruits
      t.integer :white_fruits
      t.integer :minerality
      t.integer :oak
      t.integer :dry
      t.integer :acid
      t.integer :tannin
      t.integer :alcohol
      t.integer :climate
      t.integer :country
      t.integer :red_grape
      t.integer :white_grape

      t.belongs_to :user
      t.belongs_to :wine

      t.timestamps
    end
  end
end
