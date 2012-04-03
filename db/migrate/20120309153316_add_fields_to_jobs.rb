class AddFieldsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :title, :string
    add_column :jobs, :city, :string
    add_column :jobs, :province, :string
    add_column :jobs, :company_name, :string
    add_column :jobs, :salary, :float
    add_column :jobs, :is_hourly, :boolean
    add_column :jobs, :description, :text
  end
end
