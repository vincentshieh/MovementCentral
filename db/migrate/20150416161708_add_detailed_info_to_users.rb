class AddDetailedInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_title, :string
    add_column :users, :school, :string
    add_column :users, :current_city, :string
    add_column :users, :hometown, :string
    add_column :users, :bio, :text
  end
end
