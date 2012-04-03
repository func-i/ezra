class CreateAuthenticationsTable < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer  "user_id"
      t.string   "provider"
      t.string   "uid"
      t.text     "auth_response"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
