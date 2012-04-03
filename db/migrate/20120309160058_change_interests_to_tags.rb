class ChangeInterestsToTags < ActiveRecord::Migration
  def change
    rename_table :interests, :tags
    rename_column :user_interests, :interest_id, :tag_id
    rename_table :user_interests, :user_tags
  end
end
