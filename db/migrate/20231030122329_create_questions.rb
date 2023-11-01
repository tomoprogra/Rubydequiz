class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :content, null: false

      t.timestamps
    end
    
    add_index :questions, :content
  end
end
