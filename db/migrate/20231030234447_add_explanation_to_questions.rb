class AddExplanationToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :explanation, :text
  end
end
