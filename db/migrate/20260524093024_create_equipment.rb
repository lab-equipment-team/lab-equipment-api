class CreateEquipment < ActiveRecord::Migration[8.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :serial_number
      t.references :category, null: false, foreign_key: true
      t.date :purchased_on
      t.string :status

      t.timestamps
    end
  end
end
