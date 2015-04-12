class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string, null: false
    add_column :users, :company, :string, null: false
    add_column :users, :profile_picture, :string
    add_column :users, :cover_photo, :string

    add_index :users, :company
  end
end
