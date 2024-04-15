class AddChatNumberToChats < ActiveRecord::Migration[7.1]
  def up
    add_column :chats, :chat_number, :integer
  end

  def down
    remove_column :chats, :chat_number
  end
end
