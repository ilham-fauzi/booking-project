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
            book = Book.new
            post :create
            expect(assigns(:book)).to eq([book])
        end
    end
end