class CreateMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :marks do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.integer :value, null: false

      t.timestamps
    end
    add_index :marks, [:user_id, :post_id], unique: true
  end
end
