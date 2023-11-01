class AddLevelToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :level, :string
  end
end
