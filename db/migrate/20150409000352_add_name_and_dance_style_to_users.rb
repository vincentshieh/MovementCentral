class AddNameAndDanceStyleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string, null: false
    add_index :users, :fname
    add_column :users, :lname, :string, null: false
    add_index :users, :lname
    add_column :users, :dance_style, :string, null: false
    add_index :users, :dance_style
  end
end
