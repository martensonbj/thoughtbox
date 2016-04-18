class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end
end
