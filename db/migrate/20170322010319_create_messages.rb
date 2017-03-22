class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "group_id"
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
      t.timestamps
    end
  end
end
