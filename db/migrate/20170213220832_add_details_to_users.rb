class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :birthday, :date
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zip, :integer
    add_column :users, :state, :string
    add_column :users, :phone, :string
  end
end
