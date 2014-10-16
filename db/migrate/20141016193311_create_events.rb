class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.datetime :time, null: false

      t.timestamps
    end
  end
end
