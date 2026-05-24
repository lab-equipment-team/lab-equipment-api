class CreateMaintenanceRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :maintenance_records do |t|
      t.references :equipment, null: false, foreign_key: true
      t.date :performed_on
      t.string :description
      t.string :technician
      t.decimal :cost

      t.timestamps
    end
  end
end
