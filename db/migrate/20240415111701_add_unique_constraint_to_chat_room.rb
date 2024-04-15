class AddUniqueConstraintToChatRoom < ActiveRecord::Migration[7.1]
  def change
    add_index :chats, :chatroom, unique: true
  end
end
