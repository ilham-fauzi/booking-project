class Hospital < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: false
end
