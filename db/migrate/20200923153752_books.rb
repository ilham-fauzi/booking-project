class Books < ActiveRecord::Migration[6.0]
    def change
        create_table :books do |t|
            t.references :user
            t.references :doctor
            t.references :schedule
            t.integer :status
            t.string :diaseases_desciption
            t.timestamps
        end
    end
end
