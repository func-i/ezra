class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :telephone, :string
    add_column :users, :twitter_handle, :string
    add_column :users, :website, :string
    add_column :users, :bio, :text
  end
end
