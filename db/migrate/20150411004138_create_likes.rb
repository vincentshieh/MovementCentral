class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.string :likable_type, null: false
      t.integer :likable_id, null: false

      t.timestamps null: false
    end

    add_index :likes, :likable_id
  end
end
