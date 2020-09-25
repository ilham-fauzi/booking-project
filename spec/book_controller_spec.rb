require "rails_helper"

RSpec.describe Api::BookController, :type => :controller do
    describe "GET index" do
        it "return array of booking list" do
            get :index
            list_book = Book.joins(:schedule, :doctor, :user)
            expect(list_book).to eq([])
        end
    end

    describe "POST create book", :method do
        it "book schedule" do
            allow(Book).to receive_messages(id: 1, user_id: 1, doctor_id: 1, schedule_id: 1, status: 1, diaseases_desciption: 'string', created_at: '2020=09-01', updated_at: '2020-09-01', booked_date: '2020-09-10')
            post :create
            expect(assigns(:book)).to eq([book])
        end
    end
end