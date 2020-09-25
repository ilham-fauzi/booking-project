class Schedule < ApplicationRecord
    validates :doctor_id, presence: true
    validates :hospital_id, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    belongs_to :doctor
    belongs_to :hospital
    belongs_to :book
end
