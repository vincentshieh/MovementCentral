class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false
      t.integer :recipient_id, null: false
      t.text :content, null: false

      t.timestamps null: false
    end

    add_index :posts, :author_id
    add_index :posts, :recipient_id
  end
end
