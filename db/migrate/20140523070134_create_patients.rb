class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :medical_record_number
      t.date :date_of_birth
      t.string :gender
      t.string :status
      t.integer :viewed_count, default: 0
      t.boolean :is_deleted, default: false
      t.belongs_to :location, index: true

      t.timestamps
    end
  end
end
