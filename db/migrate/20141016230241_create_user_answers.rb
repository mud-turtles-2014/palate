class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.string :answer
      t.boolean :correctness
      t.belongs_to :wine_property
      t.belongs_to :event_wine
      t.belongs_to :user

      t.timestamps
    end
  end
end
