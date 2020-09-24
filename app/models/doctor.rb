class Doctor < ApplicationRecord
    validates :name, presence: true
    validates :specialization_id, presence: true
    belongs_to :specialization
end
