class Message < ApplicationRecord
    validates :message_number, presence: true, uniqueness: { scope: :chat_id }

    before_validation :set_message_number, on: :create

    
    def set_message_number
        
        max_message_number = self.class.where(chat_id: chat_id).maximum(:message_number)
        self.message_number = max_message_number ? max_message_number + 1 : 1
    end

    def self.ransackable_attributes(auth_object = nil)
        %w[text]
        # ['chat','message']
        # ransackable_attributes(auth_object)
        # ['message']
      end

      def self.ransackable_associations(auth_object = nil)
      ['message']
        # @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
      end
end
