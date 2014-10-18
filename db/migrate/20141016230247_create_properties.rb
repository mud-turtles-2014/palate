class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :property
      t.boolean :red_only


      t.timestamps
    end
  end
end

