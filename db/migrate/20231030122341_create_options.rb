class CreateOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :options, id: false do |t|
      t.string :content, null: false
      t.boolean :correct, default: false
      t.references :question, null: false, foreign_key: true
      t.timestamps
    end
    add_index :options, :content
  end
end
