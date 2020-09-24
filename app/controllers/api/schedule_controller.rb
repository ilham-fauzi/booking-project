module Api
    class ScheduleController < ApplicationController
        def index
            schedule = Schedule.joins(:doctor, :hospital).select('
                schedules.id as id,
                doctors.name as doctor_name,
                hospitals.name as hospital_name,
                schedules.day as day,
                schedules.start_time as start_time,
                schedules.end_time as end_time
            ');
            render json: {
                status: 'SUCCESS',
                message: 'Load Doctor Schedule',
                data: schedule
            }
        end
    end
end
