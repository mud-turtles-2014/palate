class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.datetime :date, null: false
      t.datetime :time, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
