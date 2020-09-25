require 'time'

module Api
    class BookController < ApplicationController
        skip_before_action :verify_authenticity_token
        def index
            begin
                list_booked = Book.joins(:schedule, :doctor, :user).select('
                    books.id as id,
                    doctors.name as doctor_name,
                    schedules.start_time as start_time,
                    schedules.end_time as end_time,
                    schedules.day as schedule_day,
                    users.name as username,
                    books.booked_date as booked_date
                ')
                if !list_booked.present? then
                    raise Exception.new "list jadwal dokter dan pasien kosong"
                else
                    render json: {status: 'SUCCESS', message: 'list jadwal dokter dan pasien', data: list_booked}, status: :ok
                end
            rescue Exception => e
                render json: { status: 'ERROR', message: 'list jadwal error', data: e}, status: :unprocessable_entity
            end
        end


        def create
            begin
                # nama hari yang di booking
                schedule_day = Time.parse(params[:booked_date]).strftime("%A")
                # mencari schedule dokter dg criteria doctor_id, hospital_id dan nama hari
                doctor_schedule = Schedule.where(doctor_id: params[:doctor_id], hospital_id: params[:hospital_id], day: schedule_day).take
                # jika schedule tidak ditemukan
                if !doctor_schedule.present? then 
                    raise Exception.new "jadwal tidak ditemukan"
                end
                # mencari jumlah total pasin yang telah book di schedule di atas
                booked_total = Book.where("schedule_id = :schedule_id AND DATE(booked_date) = :booked_date", {
                    schedule_id: doctor_schedule[:id], booked_date: Date.parse(params[:booked_date])
                }).count || 0
                # jika total pasien telah mencapai jumlah 10 maka di tolak
                if booked_total >= 10 then
                    raise Exception.new "jadwal doctor penuh" 
                end
                # validasi untuk batas waktu book schedule
                # start_time dari schedule
                schedule_start_time = Time.new.strftime("%Y-%m-%d #{doctor_schedule[:start_time]}")
                # request time dari user
                request_schedule = Time.new.strftime("%Y-%m-%d %H:%m")
                # jika request schedule masih dibawah batasan waktu yang ditentukan
                if request_schedule < schedule_start_time && TimeDifference.between(schedule_start_time, request_schedule).in_minutes >= 30 then
                    booked = Book.new({
                        user_id: params[:user_id],
                        doctor_id: params[:doctor_id],
                        schedule_id: doctor_schedule[:id],
                        booked_date: params[:booked_date],
                        status: 1,
                        diaseases_desciption: params[:diaseases_desciption],
                    })
                    if booked.save
                        render json: { status: 'SUCCESS', message: 'booking jadwal sukses', data: {}}, status: :ok
                    else
                        render json: { status: 'ERROR', message: 'booking jadwal gagal', data: booked.errors}, status: :unprocessable_entity
                    end
                end
            rescue Exception => e
                render json: { status: 'ERROR', message: 'booking jadwal gagal', data: e}, status: :unprocessable_entity
            end
        end

        private

        def book_params
            params.require(:book).permit(:doctor_id, :hospital_id, :user_id, :book_time, :book_day)
        end
    end
end
