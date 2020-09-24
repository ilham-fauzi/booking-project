class Hospitals < ActiveRecord::Migration[6.0]
    def change
        create_table :hospitals do |t|
            t.string :name, null: false
            t.string :address, null: false
            t.timestamps
        end
        add_index :hospitals, :name
    end
end
