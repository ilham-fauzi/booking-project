module Api
    class BookController < ApplicationController
        skip_before_action :verify_authenticity_token
        def create
            begin
                doctor_schedule = Schedule.where(doctor_id: params[:doctor_id], hospital_id: params[:hospital_id]).take
                if !doctor_schedule.present? then 
                    raise Exception.new "schedule tidak ditemukan"
                end
                booked_total = Book.where("schedule_id = :schedule_id AND DATE(booked_date) = :booked_date", {
                    schedule_id: doctor_schedule[:id], booked_date: Date.parse(params[:booked_date])
                }).count || 0
                if booked_total >= 1 then
                    raise Exception.new "tanggal booking penuh" 
                end

                schedule_start_time = Time.new.strftime("%Y-%m-%d #{doctor_schedule[:start_time]}")
                request_schedule = Time.new.strftime("%Y-%m-%d %H:%m")
                if request_schedule < schedule_start_time then
                    if TimeDifference.between(schedule_start_time, request_schedule).in_minutes >= 30 then
                        booked = Book.new({
                            user_id: params[:user_id],
                            doctor_id: params[:doctor_id],
                            schedule_id: doctor_schedule[:id],
                            booked_date: params[:booked_date],
                            status: 1,
                            diaseases_desciption: params[:diaseases_desciption],
                        })
                        if booked.save
                            render json: { status: 'SUCCESS', message: 'booking success', data: {}}, status: :ok
                        else
                            render json: { status: 'ERROR', message: 'booking gagal', data: booked.errors}, status: :unprocessable_entity
                        end
                    end
                end
            rescue Exception => e
                render json: { status: 'ERROR', message: 'booking gagal', data: e}, status: :unprocessable_entity
            end
        end

        private

        def book_params
            params.require(:book).permit(:doctor_id, :hospital_id, :user_id, :book_time, :book_day)
        end
    end
end
