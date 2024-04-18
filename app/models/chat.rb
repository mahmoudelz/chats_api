class Chat < ApplicationRecord
    has_many :messages
    validates :chatroom, uniqueness: true
    validates :chat_number, presence: true, uniqueness: { scope: :app_id }

    before_validation :set_chat_number, on: :create

    def set_chat_number
        max_chat_number = self.class.where(app_id: app_id).maximum(:chat_number)
        self.chat_number = max_chat_number ? max_chat_number + 1 : 1
    end

    def self.ransackable_attributes(auth_object = nil)
        %w[chatroom]
        # ['chat','message']
        # ransackable_attributes(auth_object)
        # ['message']
      end

      def self.ransackable_associations(auth_object = nil)
      ['chat']
        # @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
      end

end
