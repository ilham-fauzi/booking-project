class AddColumnToSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :day, :string
  end
end
