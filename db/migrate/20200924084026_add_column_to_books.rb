class AddColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :booked_date, :string
  end
end
