class App < ApplicationRecord
    has_many :chats
    validates :name, uniqueness: true

    def self.ransackable_attributes(auth_object = nil)
        %w[name]
        # ['chat','message']
        # ransackable_attributes(auth_object)
        # ['message']
      end

      def self.ransackable_associations(auth_object = nil)
      ['app']
        # @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
      end
end
