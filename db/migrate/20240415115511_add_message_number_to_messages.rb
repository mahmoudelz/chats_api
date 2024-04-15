class AddMessageNumberToMessages < ActiveRecord::Migration[7.1]
  def up
    add_column :messages, :message_number, :integer
  end

  def down
    remove_column :messages, :message_number
  end
end
