class Schedules < ActiveRecord::Migration[6.0]
    def change
        create_table :schedules do |t|
            t.references :doctor
            t.references :hospital
            t.string :start_time, null: false
            t.string :end_time, null: false
            t.timestamps
        end
    end
end
