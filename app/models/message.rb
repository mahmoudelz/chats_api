class Message < ApplicationRecord
    validates :chat_number, presence: true, uniqueness: { scope: :chat_id }

    before_validation :set_message_number, on: :create

    def set_message_number
        max_message_number = self.class.where(app_id: app_id).maximum(:message_number)
        self.message_number = max_message_number ? max_message_number + 1 : 1
        end
end
