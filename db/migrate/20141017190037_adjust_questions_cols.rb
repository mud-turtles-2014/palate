class AdjustQuestionsCols < ActiveRecord::Migration
  def change
    add_column :questions, :red_only, :boolean
    remove_column :questions, :answer_data_type
  end
end
