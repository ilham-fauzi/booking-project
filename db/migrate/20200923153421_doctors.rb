class Doctors < ActiveRecord::Migration[6.0]
    def change
        create_table :doctors do |t|
            t.string :name, null: false
            t.references :specialization
            t.timestamps
        end
        add_index :doctors, :name
    end
end
