class CreateUserResults < ActiveRecord::Migration
  def change
    create_table :user_results do |t|
      t.belongs_to :tasting
      t.string :category
      t.boolean :is_correct

      t.timestamps
    end
  end
end
