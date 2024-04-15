class AddUniqueConstraintToChatNumber < ActiveRecord::Migration[7.1]
  def change
    add_index :chats, [:chat_number, :app_id], unique: true

  end
end
