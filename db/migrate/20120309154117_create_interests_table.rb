class CreateInterestsTable < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :name
      t.timestamps
    end
  end
end
