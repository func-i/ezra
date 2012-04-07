class CreateUserFilesTable < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.integer :user_id
      t.string :file
      t.timestamps
    end
  end
end
