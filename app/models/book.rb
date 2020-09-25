class Book < ApplicationRecord
    validates :user_id, presence: true
    validates :doctor_id, presence: true
    validates :schedule_id, presence: true
    validates :status, presence: true
    validates :diaseases_desciption, presence: false
    validates :booked_date, presence: true
    belongs_to :doctor
    belongs_to :schedule
    belongs_to :user
end
