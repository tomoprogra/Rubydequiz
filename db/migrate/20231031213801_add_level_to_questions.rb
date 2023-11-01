class AddLevelToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :level, :string, null: false, default: "easy"
    add_index :questions, :level
  end
end
