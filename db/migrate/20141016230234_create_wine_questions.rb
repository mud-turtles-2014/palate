class CreateWineQuestions < ActiveRecord::Migration
  def change
    create_table :wine_questions do |t|
      t.string :correct_answer
      t.belongs_to :question
      t.belongs_to :wine

      t.timestamps
    end
  end
end
