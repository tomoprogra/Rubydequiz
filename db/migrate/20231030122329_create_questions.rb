class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    add_index :questions, :content
    create_table :questions do |t|
      t.string :content, null: false

      t.timestamps
    end
  end
end
