class AddUniqueConstraintToMessageNumber < ActiveRecord::Migration[7.1]
  def change
    add_index :messages, [:message_number, :chat_id], unique: true

  end
end
