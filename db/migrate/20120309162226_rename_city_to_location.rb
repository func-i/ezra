class RenameCityToLocation < ActiveRecord::Migration
  def change
    rename_column :users, :city, :location
    remove_column :users, :province

    rename_column :jobs, :city, :location
    remove_column :jobs, :province

  end
end
