class Chat < ApplicationRecord
    has_many :messages
    validates :chatroom, uniqueness: true
end
