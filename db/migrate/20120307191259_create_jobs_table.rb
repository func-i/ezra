class CreateJobsTable < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer  "user_id"
    end
  end
end
