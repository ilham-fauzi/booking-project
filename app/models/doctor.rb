class Doctor < ApplicationRecord
    validates :name, presence: true
    validates :specialization_id, presence: true
    belongs_to :specialization
    belongs_to :book
    belongs_to :schedule
end
