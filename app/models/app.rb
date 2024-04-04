class App < ApplicationRecord
    has_many :chats
    validates :name, uniqueness: true

end
