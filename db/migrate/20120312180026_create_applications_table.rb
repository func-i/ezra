class CreateApplicationsTable < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.integer :job_id
      t.integer :user_id
    end
  end
end
