class CreateJobTags < ActiveRecord::Migration
  def change
    create_table :job_tags do |t|
      t.integer :job_id
      t.integer :tag_id
    end
  end
end
