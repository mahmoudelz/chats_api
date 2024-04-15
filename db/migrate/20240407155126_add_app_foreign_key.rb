class AddAppForeignKey < ActiveRecord::Migration[7.1]
  def change
    # add_reference :orders, :customer, foreign_key: true
    add_reference :chats, :app, foreign_key: true
  end
end
