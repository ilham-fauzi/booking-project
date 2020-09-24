class Schedule < ApplicationRecord
    validates :doctor_id, presence: true
    validates :hospital_id, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    has_one :doctor
    has_one :hospital
end
