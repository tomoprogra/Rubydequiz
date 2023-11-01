class CreateOptions < ActiveRecord::Migration[7.1]
  def change
    add_index :options, :content
    create_table :options do |t|
      t.string :content, null: false
      t.boolean :correct, default: false
      t.references :question, null: false, foreign_key: true
      t.integer :id, primary_key: true
      t.timestamps
    end
  end
end
