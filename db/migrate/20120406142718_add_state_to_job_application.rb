class AddStateToJobApplication < ActiveRecord::Migration
  def change
    add_column :job_applications, :state, :string
  end
end
